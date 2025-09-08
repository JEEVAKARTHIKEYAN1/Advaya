'use strict';

const mongoose = require('mongoose');

const CropRecommendationSchema = new mongoose.Schema(
  {
    input: { type: Object, required: true },
    recommendations: [
      {
        label: { type: String, required: true },
        probability: { type: Number, required: true },
      },
    ],
    rationale: { type: String },
    topFeatures: { type: Object },
    source: { type: String, enum: ['ml', 'rule'], default: 'ml' },
  },
  { timestamps: true }
);

module.exports = mongoose.model('CropRecommendation', CropRecommendationSchema);

