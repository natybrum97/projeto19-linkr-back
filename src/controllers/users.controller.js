import bcrypt from "bcrypt";
import { stripHtml } from "string-strip-html";
import { v4 as uuid } from 'uuid';
import { CheckRegistration, EnterRegistrationData, FindUserPostsDB, RegisterLogin, SearchUsersByName } from "../repository/users.repository.js";

export async function postSignUp (req, res) {

    const { email, password, username, url } = req.body;
    
    const sanitizedEmail = stripHtml(email).result.trim();
    const sanitizedUsername = stripHtml(username).result.trim();
    const sanitizedPassword = stripHtml(password).result.trim();
    const sanitizedUrl = stripHtml(url).result.trim();

    try {

      const user = await CheckRegistration (sanitizedEmail);
      
        if (user.rows.length > 0) return res.status(409).send("This user already exists!");

        const hash = bcrypt.hashSync(sanitizedPassword, 10);

        await EnterRegistrationData (sanitizedEmail, sanitizedUsername, hash, sanitizedUrl);

        res.sendStatus(201);

    } catch (err) {
        res.status(500).send(err.message);
    }

}

export async function postLogin (req, res) {

    const { email, password } = req.body;

    const sanitizedEmail = stripHtml(email).result.trim();
    const sanitizedPassword = stripHtml(password).result.trim();


    try {

      const user = await CheckRegistration (sanitizedEmail);
      
        if (user.rows.length === 0) return res.status(401).send("User not registered!");

       const passwordIsCorrect = bcrypt.compareSync(sanitizedPassword, user.rows[0].password);
        if (!passwordIsCorrect) return res.status(401).send("Incorrect password!");

      const token = uuid();

      await RegisterLogin (token, user);

      return res.status(200).send({token: token, username: user.rows[0].username, url: user.rows[0].pictureUrl, id: user.rows[0].id});

    } catch (err) {
      res.status(500).send(err.message);
    }
}

export async function getUserPosts(req, res) {
  const { id } = req.params;

  try {
    const userPosts = await FindUserPostsDB(id, req.query);
    res.status(200).send(userPosts);
    
  } catch (error) {
    res.status(500).send(error.message);    
  }
}

export async function getUsersByName(req, res) {
  const { query } = req.query;
  const { authorization } = req.headers;

  try {
    let users;

    if (query && query.length >= 3) {

      users = await SearchUsersByName(authorization.replace("Bearer ", ""), query);
      
    } else {

      users = [];

    }

    res.send(users.rows);

  } catch (err) {
    res.status(500).send(err.message);
  }
}