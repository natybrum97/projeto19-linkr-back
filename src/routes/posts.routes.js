import { Router } from 'express';
import { postPost } from '../controllers/posts.controller.js';
import { validateAuth } from '../middlewares/validateAuth.js';
import { validateSchema } from '../middlewares/validateSchema.js';
import { postSchema } from '../schemas/post.schemas.js';

const postsRouter = Router();

postsRouter.get('/timeline', );
postsRouter.post('/post', validateAuth, validateSchema(postSchema), postPost);

export default postsRouter;