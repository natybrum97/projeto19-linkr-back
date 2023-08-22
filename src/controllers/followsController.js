import { insertFollow, selectFollow } from "../repository/follows.repository.js";

export const postFollow = async (req, res) => {
  const { authorization } = req.headers;
  const { idFollowed } = req.body;
  try {
    const response = await insertFollow(idFollowed, authorization.replace("Bearer ", ""));
    if (response === 'You cannot follow yourself') return res.status(400).send({ message: response});
    if (response.command === 'DELETE') return res.sendStatus(204);
    res.sendStatus(201);
  } catch ({ detail }) {
    res.status(500).send({ message: detail });
  }
};

export const getFollow = async (req, res) => {
  const { authorization } = req.headers;
  const { idFollowed } = req.params;
  try {
    const { rows } = await selectFollow(idFollowed, authorization.replace("Bearer ", ""));
    res.send(rows);
  } catch ({ detail }) {
    res.status(500).send({ message: detail });
  }
};