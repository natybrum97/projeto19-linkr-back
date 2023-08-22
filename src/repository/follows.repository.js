import { db } from "../database/database.connection.js";

export const insertFollow = async (idFollowed, token) => {
  const { rows } = await db.query('SELECT sessions."idUser" FROM sessions WHERE token = $1;', [token]);
  if (rows[0].idUser === idFollowed) return 'You cannot follow yourself';

  try {
    return await db.query(`
      INSERT INTO follows ("idFollower", "idFollowed") 
      VALUES ($1, $2)
      ;`, [rows[0].idUser, idFollowed]);
  } catch (err) {
    if (err.code === '23505') return db.query(`
      DELETE FROM follows WHERE "idFollower" = $1 AND "idFollowed" = $2
    ;`, [rows[0].idUser, idFollowed]);
    return err; 
  }
};

export const selectFollow = (idFollowed, token) => {
  return db.query(`
    SELECT * FROM follows 
    WHERE 
      "idFollower" = (SELECT sessions."idUser" FROM sessions WHERE token = $1) AND 
      "idFollowed" = $2
    ;`, [token, idFollowed]
  );
}