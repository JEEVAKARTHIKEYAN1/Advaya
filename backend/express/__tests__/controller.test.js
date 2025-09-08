'use strict';

jest.mock('axios');
jest.mock('../models/CropRecommendation', () => ({ create: jest.fn(async (doc) => ({ _id: 'mockid', ...doc })) }));

const axios = require('axios');
const { recommendCrop } = require('../controllers/cropRecommendationController');

describe('recommendCrop controller', () => {
  test('returns ML recommendations when service is available', async () => {
    axios.post.mockResolvedValueOnce({ data: { recommendations: [{ label: 'rice', probability: 0.7 }], rationale: 'x', top_features: { a: 1 } } });
    const req = { body: { N: 10, P: 10, K: 10, season: 'monsoon' } };
    const json = jest.fn();
    const res = { json };
    await recommendCrop(req, res);
    expect(json).toHaveBeenCalledWith(expect.objectContaining({ source: 'ml' }));
  });

  test('falls back to rule-based on error', async () => {
    axios.post.mockRejectedValueOnce(new Error('timeout'));
    const req = { body: { season: 'winter', top_k: 2 } };
    const json = jest.fn();
    const res = { json, status: () => ({ json }) };
    await recommendCrop(req, res);
    expect(json).toHaveBeenCalledWith(expect.objectContaining({ source: 'rule' }));
  });
});

