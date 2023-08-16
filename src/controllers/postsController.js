import urlMetadata from "url-metadata";
import { insertHashtags, insertPost, insertTrends, selectPosts } from "../repository/posts.repository.js";
import { selectSessionByToken } from "../repository/sessions.repository.js";

export const postPost = async (req, res) => {
  const { postText } = req.body;
  const { authorization } = req.headers;

  try {
    const session = await selectSessionByToken(authorization.replace("Bearer ", ""));

    const insertedPost = await insertPost(req.body, session.rows[0].idUser);

    if (postText){
      const hashtags = postText.match(/#\w+/g);
      if (hashtags){
        const hashtagsIds = await insertHashtags(hashtags);
        await insertTrends(insertedPost.rows[0].id, hashtagsIds);
      }
    };

    res.sendStatus(201);
  } catch ({ detail }) {
    res.status(500).send({ message: detail });
  }
};

export const getPosts = async (req, res) => {
  try {
    const { rows } = await selectPosts();
    for (let i = 0; i < rows.length; i++){
      const { description, url, 'og:title': title, 'og:description': ogDescription, 'og:image': image } = await urlMetadata(rows[i].postUrl);
      rows[i].urlMetaData = { title: title || url, description: ogDescription || description , image };
    }
    res.send(rows);
  } catch ({ detail }) {
    res.status(500).send({ message: detail });
  }
}