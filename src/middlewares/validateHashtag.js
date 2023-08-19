export function validateHashtag(schema) {
  return (req, res, next) => {
    const validation = schema.validate(req.params, { abortEarly: false });

    if (validation.error) {
      const errors = validation.error.details.map((detail) => detail.message);
      return res.status(422).send(errors);
    }

    next();
  };
}
