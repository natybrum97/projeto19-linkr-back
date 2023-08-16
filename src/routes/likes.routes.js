import express from "express";
import { likePost, getLikeCount, unlikePost } from "../controllers/likesController.js";

const router = express.Router();

// Rota para curtir um post
router.post("/like", likePost);

// Rota para obter contagem de curtidas de um post

router.get("/likes/:idPost", getLikeCount);

// Rota para descurtir post
router.post("/unlike", unlikePost);



export default router;
