const mongoose = require('mongoose');

const contactSubmissionSchema = new mongoose.Schema({
  name: { type: String, required: true },
  company: { type: String, required: true },
  email: { type: String, required: true },
  phone: { type: String, required: true },
  serviceRequired: { type: String, required: true },
  message: { type: String, required: true },
  status: { type: String, enum: ['New', 'In Review', 'Resolved'], default: 'New' }
}, { timestamps: true });

module.exports = mongoose.model('ContactSubmission', contactSubmissionSchema);
