import { Router } from "express";
import {
  deletePostsController,
  editPostById,
  getNewPosts,
  getPosts,
  postPost,
  sharePost,
} from "../controllers/postsController.js";
import { validateAuth } from "../middlewares/validateAuth.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { postSchema } from "../schemas/post.schemas.js";
import { sharePostSchema } from "../schemas/sharePost.Schema.js";

const postsRouter = Router();

postsRouter.post("/post", validateAuth, validateSchema(postSchema), postPost);
postsRouter.get("/post", validateAuth, getPosts);
postsRouter.post("/getNewPosts", validateAuth, getNewPosts);
postsRouter.put("/post/:postId", validateAuth, validateSchema(postSchema), editPostById);
postsRouter.delete("/post/:postId", validateAuth, deletePostsController);
postsRouter.post("/post/share", validateAuth, validateSchema(sharePostSchema), sharePost);

export default postsRouter;
