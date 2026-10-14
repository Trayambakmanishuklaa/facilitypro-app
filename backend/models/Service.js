const mongoose = require('mongoose');

const serviceSchema = new mongoose.Schema({
  title: { type: String, required: true },
  category: { type: String, required: true },
  summary: { type: String, required: true },
  description: { type: String, required: true },
  capabilities: [{ type: String }],
  benefits: [{ type: String }],
  imageUrl: { type: String, default: '' },
  iconName: { type: String, default: 'business' },
  isFeatured: { type: Boolean, default: false }
}, { timestamps: true });

module.exports = mongoose.model('Service', serviceSchema);
