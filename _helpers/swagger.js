const express = require('express');
const router = express.Router();
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const swaggerDocument = YAML.load('./swagger.yaml');

//Swagger is a set of open-source tools built around the OpenAPI Specification that can help you design, build, document and consume REST APIs.



router.use('/', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

module.exports = router;