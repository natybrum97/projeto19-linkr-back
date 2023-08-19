import {
  insertHashtags,
  insertPost,
  insertTrends,
  selectPosts,
  deletePost,
} from "../repository/posts.repository.js";
import { selectSessionByToken } from "../repository/sessions.repository.js";

export const postPost = async (req, res) => {
  const { postText } = req.body;
  const { authorization } = req.headers;

  try {
    const session = await selectSessionByToken(
      authorization.replace("Bearer ", "")
    );

    const insertedPost = await insertPost(req.body, session.rows[0].idUser);

    if (postText) {
      const hashtags = postText.match(/#\w+/g);
      if (hashtags) {
        const hashtagsIds = await insertHashtags(hashtags);
        await insertTrends(insertedPost.rows[0].id, hashtagsIds);
      }
    }

    res.sendStatus(201);
  } catch ({ detail }) {
    res.status(500).send({ message: detail });
  }
};

export const getPosts = async (req, res) => {
  try {
    const { rows } = await selectPosts();
    res.send(rows);
  } catch ({ message }) {
    res.status(500).send(message);
  }
};

export const deletePostsController = async (req, res) => {
  const { postId } = req.params;

  try {
    // Aqui você pode chamar a função de exclusão do post com o postId
    await deletePost(postId);

    res.sendStatus(204); // Resposta de sucesso (No Content) quando o post é excluído
  } catch (error) {
    console.error("Error:", error); // Log do erro para depuração
    res.status(500).send({ message: error.message });
  }
};
