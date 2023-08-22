import { Router } from "express";
import {
  deletePostsController,
  editPostById,
  getPosts,
  postPost,
} from "../controllers/postsController.js";
import { validateAuth } from "../middlewares/validateAuth.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { postSchema } from "../schemas/post.schemas.js";

const postsRouter = Router();

postsRouter.post("/post", validateAuth, validateSchema(postSchema), postPost);
postsRouter.get("/post", validateAuth, getPosts);
postsRouter.put("/post/:postId", validateAuth, validateSchema(postSchema), editPostById);
postsRouter.delete("/post/:postId", validateAuth, deletePostsController);

export default postsRouter;
