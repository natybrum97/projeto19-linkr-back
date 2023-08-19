import { db } from "../database/database.connection.js";

export async function getTrending(req, res) {
  try {
    const hashtagsTrends = await db.query(
      `SELECT "hashtagText" FROM hashtags;`
    );

    res.send(hashtagsTrends.rows);
  } catch ({ detail }) {
    res.status(500).send({ message: detail });
  }
}

export async function getHashtagPosts(req, res) {
  try {
  } catch ({ detail }) {
    res.status(500).send({ message: detail });
  }
}
