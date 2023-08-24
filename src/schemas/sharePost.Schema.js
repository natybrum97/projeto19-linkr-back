import joi from 'joi';

export const sharePostSchema = joi.object({
  idOriginalPost: joi.number().integer().positive().required(),
  idUserOriginalPost: joi.number().integer().positive().required(),
  idUserRepost: joi.number().integer().positive().required(),
});
