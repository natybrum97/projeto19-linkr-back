import joi from 'joi';

export const postSchema = joi.object({
  postUrl: joi.string().uri().required(),
  postText: joi.string().allow('')
});