import { db } from "../database/database.connection.js";

async function createComment(userId, postId, content) {
  const query =
    "INSERT INTO comments (user_id, post_id, content) VALUES ($1, $2, $3) RETURNING *";
  const values = [userId, postId, content];

  try {
    const result = await db.query(query, values);
    return result.rows[0];
  } catch (error) {
    console.error(error);
    throw error;
  }
}

async function getCommentsByPost(postId) {
  const query = `
    SELECT c.id, c.content, u.username, u."pictureUrl"
    FROM comments c
    INNER JOIN users u ON c.user_id = u.id
    WHERE c.post_id = $1;
  `;
  const values = [postId];

  try {
    const result = await db.query(query, values);
    return result.rows;
  } catch (error) {
    console.error(error);
    throw error;
  }
}

export default {
  createComment,
  getCommentsByPost,
};
