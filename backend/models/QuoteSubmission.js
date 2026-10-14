const mongoose = require('mongoose');

const quoteSubmissionSchema = new mongoose.Schema({
  name: { type: String, required: true },
  company: { type: String, required: true },
  designation: { type: String, required: true },
  email: { type: String, required: true },
  phone: { type: String, required: true },
  location: { type: String, required: true },
  propertyType: { type: String, required: true },
  serviceRequired: { type: String, required: true },
  requirementDetails: { type: String, required: true },
  message: { type: String },
  status: { type: String, enum: ['New', 'Quoted', 'Closed'], default: 'New' }
}, { timestamps: true });

module.exports = mongoose.model('QuoteSubmission', quoteSubmissionSchema);
