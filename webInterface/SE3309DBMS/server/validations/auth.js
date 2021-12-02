const Joi = require('joi');

module.exports = function (requestBody) {
    const schema = Joi.object({
        name: Joi.string().required(),
        station: Joi.string().required()
    });

    return schema.validate(requestBody, {
        abortEarly: false
    });
}