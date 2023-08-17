import express from "express";
import {
  getLikeCount,
  likePost,
  unlikePost,
} from "../controllers/likesController.js";
import { validateAuth } from "../middlewares/validateAuth.js";

const likesRouter = express.Router();

// Rota para curtir um post
likesRouter.post("/like", validateAuth, likePost);

// Rota para obter contagem de curtidas de um post

likesRouter.get("/likes/:idPost", getLikeCount);

// Rota para descurtir post
likesRouter.post("/unlike", validateAuth, unlikePost);

export default likesRouter;
