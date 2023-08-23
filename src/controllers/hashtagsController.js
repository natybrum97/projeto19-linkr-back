import {
  findHashtagDB,
  getHashtagPostsDB,
  getTrendsDB,
} from "../repository/hashtags.repository.js";

export async function getTrending(req, res) {
  try {
    const hashtagsTrends = await getTrendsDB();

    res.send(hashtagsTrends.rows);
  } catch (err) {
    console.log(err.message);
    res.status(500).send(err.message);
  }
}

export async function getHashtagPosts(req, res) {
  const { hashtag } = req.params;

  const okHashtag = "#" + hashtag;

  try {
    const findHashtag = await findHashtagDB(okHashtag);

    if (findHashtag.rowCount === 0)
      return res.status(404).send({ message: "Hashtag não encontrada!" });

    const hashtagPosts = await getHashtagPostsDB(okHashtag, req.query);

    if (hashtagPosts.rowCount === 0)
      return res.status(404).send({ message: "Sem posts com essa hashtag!" });

    res.status(200).send(hashtagPosts.rows);
  } catch (err) {
    console.log(err.message);
    res.status(500).send(err.message);
  }
}
