import commentsRepository from "../repository/commentsRepository.js";

async function addComment(req, res) {
  const { user_id, post_id, content } = req.body;

  try {
    const comment = await commentsRepository.createComment(
      user_id,
      post_id,
      content
    );
    res.json(comment);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error creating comment" });
  }
}

async function getCommentsByPost(req, res) {
  const { post_id } = req.params;

  try {
    const comments = await commentsRepository.getCommentsByPost(post_id);
    res.json(comments);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching comments" });
  }
}

export { addComment, getCommentsByPost };
