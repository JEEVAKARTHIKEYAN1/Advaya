'use strict';

const axios = require('axios');
const CropRecommendation = require('../models/CropRecommendation');
const fallbackRules = require('../fallback/rule_based.json');

const ML_ENDPOINT = process.env.ML_ENDPOINT || 'http://localhost:8000/predict';
const REQUEST_TIMEOUT_MS = 5000;

async function recommendCrop(req, res) {
  try {
    const payload = req.body;
    const response = await axios.post(ML_ENDPOINT, payload, { timeout: REQUEST_TIMEOUT_MS });
    const { recommendations, rationale, top_features } = response.data;

    const doc = await CropRecommendation.create({
      input: payload,
      recommendations,
      rationale,
      topFeatures: top_features,
      source: 'ml',
    });

    return res.json({ id: doc._id, recommendations, rationale, source: 'ml' });
  } catch (err) {
    // Fallback to rule based
    try {
      const input = req.body || {};
      const season = (input.season || 'unknown').toLowerCase();
      const rules = fallbackRules[season] || fallbackRules['default'] || [];
      const recommendations = rules.slice(0, input.top_k || 3).map((r) => ({ label: r.label, probability: r.score }));

      const doc = await CropRecommendation.create({
        input,
        recommendations,
        rationale: 'Rule-based fallback due to ML service error/timeout',
        topFeatures: {},
        source: 'rule',
      });

      return res.json({ id: doc._id, recommendations, rationale: 'Rule-based fallback', source: 'rule' });
    } catch (fallbackErr) {
      return res.status(500).json({ error: 'Failed to generate recommendation', details: fallbackErr.message });
    }
  }
}

module.exports = { recommendCrop };

