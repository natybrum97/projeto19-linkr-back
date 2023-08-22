import joi from 'joi';

export const followSchema = joi.object({
  idFollowed: joi.number().required()
});