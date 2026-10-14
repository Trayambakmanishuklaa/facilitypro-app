const mongoose = require('mongoose');

const jobOpeningSchema = new mongoose.Schema({
  title: { type: String, required: true },
  location: { type: String, required: true },
  experience: { type: String, required: true },
  department: { type: String, required: true },
  employmentType: { type: String, default: 'Full-Time' },
  description: { type: String, required: true },
  requirements: [{ type: String }],
  isOpen: { type: Boolean, default: true }
}, { timestamps: true });

module.exports = mongoose.model('JobOpening', jobOpeningSchema);
