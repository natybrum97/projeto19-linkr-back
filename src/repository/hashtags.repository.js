import { db } from "../database/database.connection.js";

export const getTrendsDB = () => {
  return db.query(
    `SELECT hashtags."hashtagText", COUNT(trends."idPost") AS "count"
        FROM hashtags 
    JOIN trends ON hashtags.id = trends."idHashtag"
        GROUP BY hashtags."hashtagText"
        ORDER BY "count" DESC LIMIT 10;`
  );
};

export const findHashtagDB = (okHashtag) => {
  return db.query(
    `SELECT "hashtagText" FROM hashtags WHERE "hashtagText" = $1;`,
    [okHashtag]
  );
};

export const getHashtagPostsDB = (okHashtag, query) => {
  const { page, qtd } = query;
  const params = [okHashtag];
  if (page && qtd) params.push(qtd, (page - 1) * qtd);

  return db.query(
    `
    SELECT posts.id, posts."postUrl", posts."postText", (SELECT users.username FROM users WHERE users.id = posts."repostById") AS "repostedBy",
        JSON_BUILD_OBJECT(
          'id', users.id,
          'name', users.username,
          'pictureUrl', users."pictureUrl"
        ) AS user,
        COUNT(reposts.id) AS "repostCount"
    FROM posts JOIN users ON users.id = posts."idUser"
        JOIN trends ON posts.id = trends."idPost"
        JOIN hashtags ON hashtags.id = trends."idHashtag"
        LEFT JOIN reposts ON reposts."idOriginalPost" = posts.id
        WHERE hashtags."hashtagText" = $1
        GROUP BY posts.id, users.id
        ORDER BY posts.id DESC

    ${page && qtd 
      ? 'LIMIT $2 OFFSET $3' : ''
    }
    ;`, params
  );
};
