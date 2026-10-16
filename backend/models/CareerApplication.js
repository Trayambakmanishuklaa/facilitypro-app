const mongoose = require('mongoose');

const careerApplicationSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true },
  phone: { type: String, required: true },
  location: { type: String, required: true },
  positionAppliedFor: { type: String, required: true },
  experience: { type: String, required: true },
  qualification: { type: String, required: true },
  resumeName: { type: String, default: '' },
  resumeBase64: { type: String, default: '' },
  message: { type: String },
  status: { type: String, enum: ['Received', 'Shortlisted', 'Rejected'], default: 'Received' }
}, { timestamps: true });

module.exports = mongoose.model('CareerApplication', careerApplicationSchema);
