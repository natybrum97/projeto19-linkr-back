import { Router } from "express";
import {
  getPosts,
  postPost,
  deletePostsController,
} from "../controllers/postsController.js";
import { validateAuth } from "../middlewares/validateAuth.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { postSchema } from "../schemas/post.schemas.js";

const postsRouter = Router();

postsRouter.post("/post", validateAuth, validateSchema(postSchema), postPost);
postsRouter.get("/post", getPosts);
postsRouter.delete("/post/:postId", validateAuth, deletePostsController);

export default postsRouter;
