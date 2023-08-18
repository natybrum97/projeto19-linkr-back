import { db } from "../database/database.connection.js";

export const insertPost = (body, idUser) => {
  const { postUrl, postText } = body;

  if (!postText) return db.query('INSERT INTO posts ("postUrl", "idUser") VALUES ($1, $2) RETURNING id;', [postUrl, idUser]);

  return db.query('INSERT INTO posts ("postUrl", "postText", "idUser") VALUES ($1, $2, $3) RETURNING id;', [postUrl, postText, idUser]);
};

export const insertHashtags = async (hashtags) => {
  const hashtagsIds = [];

  const selectedHashtags = await db.query(`SELECT hashtags.id, hashtags."hashtagText" FROM hashtags WHERE "hashtagText" IN (${hashtags.map(hashtag => `'${hashtag}'`).join(', ')});`);
  selectedHashtags.rows.forEach(({ id }) => hashtagsIds.push(id));

  const hashTagsToInsert = hashtags.filter(hashtag => !selectedHashtags.rows.some(({ hashtagText }) => hashtagText === hashtag));
  if (hashTagsToInsert.length === 0) return hashtagsIds;
  const insertedHashtags = await db.query(`INSERT INTO hashtags ("hashtagText") VALUES ${hashTagsToInsert.map((_, i) => `($${i+1})`).join(', ')} RETURNING id;`, hashTagsToInsert);
  insertedHashtags.rows.forEach(({ id }) => hashtagsIds.push(id));

  return hashtagsIds;
};

export const insertTrends = (idPost, hashtagsIds) => {
  return hashtagsIds.map(idHashtag => {
    return db.query('INSERT INTO trends ("idPost", "idHashtag") VALUES ($1, $2);', [idPost, idHashtag])
  });
};

export const selectPosts = () => {
  return db.query(`
    SELECT posts.id, posts."postUrl", posts."postText",
      JSON_BUILD_OBJECT(
        'id', users.id,
        'name', users.username,
        'pictureUrl', users."pictureUrl"
      ) AS user
    FROM posts
    JOIN users ON users.id = posts."idUser"

    ORDER BY posts.id DESC
    LIMIT 20
  ;`)
}
