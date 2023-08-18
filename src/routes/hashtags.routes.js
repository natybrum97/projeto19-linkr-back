import { Router } from "express";
import {
  getTrending,
  getHashtagPosts,
} from "../controllers/hashtagsController.js";

const hashtagsRouter = Router();

hashtagsRouter.get("/trending", getTrending);
hashtagsRouter.get("/hashtag/:hashtag", getHashtagPosts);

export default hashtagsRouter;
