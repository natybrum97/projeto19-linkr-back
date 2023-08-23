import express from "express";
import {
  addComment,
  getCommentsByPost,
} from "../controllers/commentsController.js";
import { validateAuth } from "../middlewares/validateAuth.js";

const commentsRouter = express.Router();

// Rota para adicionar um comentario
commentsRouter.post("/comment", validateAuth, addComment);
commentsRouter.get("/comment/:post_id", validateAuth, getCommentsByPost);

export default commentsRouter;
