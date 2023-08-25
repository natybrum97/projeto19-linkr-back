import { db } from "../database/database.connection.js";

export function CheckRegistration(sanitizedEmail) {
  const resultado = db.query("SELECT * FROM users WHERE email = $1;", [
    sanitizedEmail,
  ]);

  return resultado;
}

export function EnterRegistrationData(
  sanitizedEmail,
  sanitizedUsername,
  hash,
  sanitizedUrl
) {
  const result = db.query(
    'INSERT INTO users (username, email, password, "pictureUrl") VALUES ($1, $2, $3, $4)',
    [sanitizedUsername, sanitizedEmail, hash, sanitizedUrl]
  );

  return result;
}

export function RegisterLogin(token, user) {
  const result = db.query(
    'INSERT INTO sessions (token, "idUser") VALUES ($1, $2)',
    [token, user.rows[0].id]
  );

  return result;
}

export async function FindUserPostsDB(id, query) {
  const { page, qtd } = query;
  const params = [id];
  if (page && qtd) params.push(qtd, (page - 1) * qtd);

  const user = await db.query(`
    SELECT JSON_BUILD_OBJECT(
      'user', JSON_BUILD_OBJECT(
        'id', u.id,
        'name', u.username,
        'pictureUrl', u."pictureUrl"
      )) AS "userPosts"
    FROM users u
    WHERE u.id = $1
    ;`, [id]
  );
  const { rows } = await db.query(`
    SELECT posts.id, posts."postText", posts."postUrl",
    (
      SELECT username
      FROM users AS users_repost
      WHERE users_repost.id = reposts."idUserRepost"
    ) AS "repostedBy",
    COUNT(reposts.id) AS "repostCount"
    FROM posts
    LEFT JOIN reposts ON reposts."idOriginalPost" = posts.id
    WHERE posts."idUser" = $1
    GROUP BY posts.id, reposts."idUserRepost"
    ${page && qtd 
      ? 'LIMIT $2 OFFSET $3' : ''
    }
  ;`, params);
  
  user.rows[0].userPosts.userPosts = [...rows];
  return user.rows[0];
}

export async function SearchUsersByName(token, query) {
  const queryString = `
    SELECT users.id, users.username, users."pictureUrl",
      BOOL_OR(follows."idFollower" = 
        (SELECT sessions."idUser" FROM sessions where token = $1)
      ) AS "followedByYou"
    FROM users
    LEFT JOIN follows ON users.id = follows."idFollowed"
    WHERE username ILIKE $2
    GROUP BY users.id
    ORDER BY "followedByYou" DESC;
  `;

  const result = await db.query(queryString, [token, `%${query}%`]);
  return result;
}
