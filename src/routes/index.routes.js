import { Router } from "express";
import likesRouter from "./likes.routes.js";
import postsRouter from "./posts.routes.js";

const indexRouter = Router();
indexRouter.use(likesRouter, postsRouter);

export default indexRouter;