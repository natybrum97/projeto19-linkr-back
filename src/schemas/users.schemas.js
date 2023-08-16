import Joi from "joi";

export const schemaSignUp = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().min(3).required(),
    username: Joi.string().required(),
    url: Joi.string().required()
});

export const schemaLogin = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().min(3).required()
});