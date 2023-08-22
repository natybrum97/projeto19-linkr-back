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

export function FindUserPostsDB(id) {
  return db.query(
    `
    SELECT JSON_BUILD_OBJECT(
        'user', JSON_BUILD_OBJECT(
            'id', u.id,
            'name', u.username,
            'pictureUrl', u."pictureUrl"
        ),
        'userPosts',
        CASE
            WHEN COUNT(p.id) = 0 THEN '[]'::json
            ELSE JSON_AGG(
                JSON_BUILD_OBJECT(
                    'id', p.id,
                    'postText', p."postText",
                    'postUrl', p."postUrl"
                ) ORDER BY p."createdAt" DESC
            ) 
        END
    ) AS "userPosts"
    FROM users u
    LEFT JOIN posts p ON u.id = p."idUser"
    WHERE u.id = $1
    GROUP BY u.id, u.username, u."pictureUrl";`,
    [id]
  );
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
  console.log(result.rows);
  return result;
}
