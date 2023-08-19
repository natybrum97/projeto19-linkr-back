import { db } from "../database/database.connection.js";

export const getTrendsDB = () => {
  return db.query(`SELECT "hashtagText" FROM hashtags;`);
};

export const findHashtagDB = (okHashtag) => {
  return db.query(
    `SELECT "hashtagText" FROM hashtags WHERE "hashtagText" = $1;`,
    [okHashtag]
  );
};

export const getHashtagPostsDB = (okHashtag) => {
  return db.query(
    `
    SELECT posts.id, posts."postUrl", posts."postText",
        JSON_BUILD_OBJECT(
          'name', users.username,
          'pictureUrl', users."pictureUrl"
        ) AS user
    FROM posts JOIN users ON users.id = posts."idUser"
        JOIN trends ON posts.id = trends."idPost"
        JOIN hashtags ON hashtags.id = trends."idHashtag"
        WHERE hashtags."hashtagText" = $1
        ORDER BY posts.id DESC;
    `,
    [okHashtag]
  );
};
