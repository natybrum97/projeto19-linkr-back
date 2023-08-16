import { db } from "../database/database.connection.js";

export const insertPost = (body, idUser) => {
  const { postUrl, postText } = body;

  if (!postText) return db.query('INSERT INTO posts ("postUrl", "idUser") VALUES ($1, $2) RETURNING id;', [postUrl, idUser]);

  return db.query('INSERT INTO posts ("postUrl", "postText", "idUser") VALUES ($1, $2, $3) RETURNING id;', [postUrl, postText, idUser]);
};

export const insertHashtags = async (hashtag) => {
  const hashtagsIds = [];
  for (let i = 0; i < hashtag.length; i++){
    const selectedHashtags = await db.query('SELECT hashtags.id FROM hashtags WHERE "hashtagText" = ($1);', [hashtag[i]]);
    if (selectedHashtags.rowCount > 0) {
      hashtagsIds.push(selectedHashtags.rows[0].id);
    }
    if (selectedHashtags.rowCount === 0) {
      const insertedHashtag = await db.query('INSERT INTO hashtags ("hashtagText") VALUES ($1) RETURNING id;', [hashtag[i]]);
      hashtagsIds.push(insertedHashtag.rows[0].id);
    }
  };
  return hashtagsIds;
};

export const insertTrends = (idPost, hashtagsIds) => {
  return hashtagsIds.map(idHashtag => {
    return db.query('INSERT INTO trends ("idPost", "idHashtag") VALUES ($1, $2);', [idPost, idHashtag])
  });
};
