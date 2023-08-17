import { db } from "../database/database.connection.js";

export function CheckRegistration (sanitizedEmail) {

    const resultado = db.query('SELECT * FROM users WHERE email = $1;', [sanitizedEmail]);

    return resultado;
    
}

export function EnterRegistrationData (sanitizedEmail, sanitizedUsername, hash, sanitizedUrl) {

    const result = db.query('INSERT INTO users (username, email, password, "pictureUrl") VALUES ($1, $2, $3, $4)',[sanitizedUsername, sanitizedEmail, hash, sanitizedUrl]);

    return result;
    
}

export function RegisterLogin(token, user) {

    const result = db.query('INSERT INTO sessions (token, "idUser") VALUES ($1, $2)', [token, user.rows[0].id]);

    return result;
    
}

export function FindUserPostsDB(id) {
    return db.query(`
        SELECT p."postText", p."postUrl", u.username
        FROM posts AS p
        JOIN users  u ON p."idUser" = u.id
        WHERE p."idUser" = $1
        ORDER BY p."createdAt" DESC`
        , [id]
    ); 
}