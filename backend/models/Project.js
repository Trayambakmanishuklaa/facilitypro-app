const mongoose = require('mongoose');

const projectSchema = new mongoose.Schema({
  name: { type: String, required: true },
  location: { type: String, required: true },
  industry: { type: String, required: true },
  servicesProvided: [{ type: String }],
  description: { type: String, required: true },
  imageUrl: { type: String, default: '' }
}, { timestamps: true });

module.exports = mongoose.model('Project', projectSchema);
