import { db } from "../database/database.connection.js";

export const selectSessionByToken = (token) => {
  return db.query('SELECT * FROM sessions WHERE token = $1', [token]);
};