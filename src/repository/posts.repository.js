import { db } from "../database/database.connection.js";

export const insertPost = (body, idUser) => {
  const { postUrl, postText } = body;

  if (!postText)
    return db.query(
      'INSERT INTO posts ("postUrl", "idUser") VALUES ($1, $2) RETURNING id;',
      [postUrl, idUser]
    );

  return db.query(
    'INSERT INTO posts ("postUrl", "postText", "idUser") VALUES ($1, $2, $3) RETURNING id;',
    [postUrl, postText, idUser]
  );
};

export const insertHashtags = async (hashtags) => {
  const hashtagsIds = [];

  const selectedHashtags = await db.query(
    `SELECT hashtags.id, hashtags."hashtagText" FROM hashtags WHERE "hashtagText" IN (${hashtags
      .map((hashtag) => `'${hashtag}'`)
      .join(", ")});`
  );
  selectedHashtags.rows.forEach(({ id }) => hashtagsIds.push(id));

  const hashTagsToInsert = hashtags.filter(
    (hashtag) =>
      !selectedHashtags.rows.some(({ hashtagText }) => hashtagText === hashtag)
  );
  if (hashTagsToInsert.length === 0) return hashtagsIds;
  const insertedHashtags = await db.query(
    `INSERT INTO hashtags ("hashtagText") VALUES ${hashTagsToInsert
      .map((_, i) => `($${i + 1})`)
      .join(", ")} RETURNING id;`,
    hashTagsToInsert
  );
  insertedHashtags.rows.forEach(({ id }) => hashtagsIds.push(id));

  return hashtagsIds;
};

export const insertTrends = (idPost, hashtagsIds) => {
  return hashtagsIds.map((idHashtag) => {
    return db.query(
      'INSERT INTO trends ("idPost", "idHashtag") VALUES ($1, $2);',
      [idPost, idHashtag]
    );
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
  ;`);
};

export const updatePost = async (postText, postUrl, idPost) => {

  // Exclua as entradas relacionadas às trends primeiro
  await db.query('DELETE FROM trends WHERE "idPost" = $1', [idPost]);

  // Exclua as hashtags que não estão mais associadas a nenhum trend/post
  await db.query(`
    DELETE FROM hashtags
    WHERE id NOT IN (
      SELECT DISTINCT "idHashtag" FROM trends
    );
  `);

  const hashtags = postText.match(/#\w+/g);
  if (hashtags) {
    // insira novamente as hashtags
    const hashtagsIds = await insertHashtags(hashtags);

    //insira novamente as trends
    await insertTrends(idPost, hashtagsIds);
  }

  //finalmente atualize o post
  return db.query('UPDATE posts SET "postText" = $1, "postUrl" = $2 WHERE id = $3;', [postText, postUrl, idPost]);
};

export const deletePost = async (postId) => {
  const client = await db.connect();

  try {
    await client.query("BEGIN");

    // Exclua as entradas relacionadas às trends primeiro
    await client.query('DELETE FROM trends WHERE "idPost" = $1', [postId]);

    // Exclua as entradas relacionadas aos likes depois
    await client.query('DELETE FROM likes WHERE "idPost" = $1', [postId]);

    // Exclua as hashtags que não estão mais associadas a nenhum trend/post
    await client.query(`
      DELETE FROM hashtags
      WHERE id NOT IN (
        SELECT DISTINCT "idHashtag" FROM trends
      );
    `);

    // Finalmente, exclua o post
    await client.query("DELETE FROM posts WHERE id = $1", [postId]);

    await client.query("COMMIT");
  } catch (error) {
    await client.query("ROLLBACK");
    throw error;
  } finally {
    client.release();
  }
};
