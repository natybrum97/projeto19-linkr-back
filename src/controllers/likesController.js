import { db } from "../database/database.connection.js";

export const likePost = async (req, res) => {
  try {
    const { postId, userId } = req.body;

    const client = await db.connect();

    // Verificar se o like já existe no banco de dados
    const existingLike = await client.query(
      'SELECT * FROM likes WHERE "idPost" = $1 AND "idUser" = $2',
      [postId, userId]
    );

    if (existingLike.rows.length === 0) {
      // Inserir o like no banco de dados
      await client.query(
        'INSERT INTO likes ("idUser", "idPost", "createdAt") VALUES ($1, $2, NOW())',
        [userId, postId]
      );
    }

    client.release();

    res.status(200).json({ message: "Post Liked successfully!" });
  } catch (error) {
    console.error("Erro ao curtir a postagem:", error);
    res.status(500).json({ error: "Erro ao curtir a postagem" });
  }
};

export const getLikeCount = async (req, res) => {
  try {
    const postId = req.params.idPost; // Certifique-se de usar o nome correto do parâmetro

    const client = await db.connect();

    // Consulta para obter contagem de curtidas e informações do usuário que curtiu
    const result = await client.query(
      `
      SELECT COUNT(*) AS likes_count,
             array_agg("idUser") AS usuarios_que_curtiram,
             array_agg(users."username") AS usernames
      FROM likes
      INNER JOIN users ON likes."idUser" = users."id"
      WHERE likes."idPost" = $1
      `,
      [postId]
    );

    const likesCount = result.rows[0].likes_count;
    const usersLiked = result.rows[0].usuarios_que_curtiram || [];
    const usernames = result.rows[0].usernames || [];

    client.release();

    const likesInfo = usersLiked.map((userId, index) => ({
      userId,
      username: usernames[index],
    }));

    res.status(200).json({ likesCount, usersLiked: likesInfo });
  } catch (error) {
    console.error("Erro ao obter número de curtidas:", error);
    res.status(500).json({ error: "Erro ao obter número de curtidas" });
  }
};

export const unlikePost = async (req, res) => {
  try {
    const { postId, userId } = req.body;
    const client = await db.connect();

    // Remove o like do DB
    await client.query(
      'DELETE FROM likes WHERE "idPost" = $1 AND "idUser" = $2', [postId, userId]
    );
    client.release();

    res.status(200).json({ message: "Post descurtido com sucesso!" });
  } catch (error) { 
    console.log("Erro ao descurtir post:", error);
    res.status(500).json({error: "Error ao descutir post! :("})
  }
}