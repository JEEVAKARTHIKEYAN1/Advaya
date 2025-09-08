'use strict';

const express = require('express');
const router = express.Router();
const { recommendCrop } = require('../controllers/cropRecommendationController');

router.post('/recommend', recommendCrop);

module.exports = router;

