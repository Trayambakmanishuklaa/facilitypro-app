const mongoose = require('mongoose');

const industrySchema = new mongoose.Schema({
  name: { type: String, required: true },
  description: { type: String, required: true },
  iconName: { type: String, default: 'domain' },
  imageUrl: { type: String, default: '' }
}, { timestamps: true });

module.exports = mongoose.model('Industry', industrySchema);
