const mongoose = require('mongoose');

const appSettingsSchema = new mongoose.Schema({
  appName: { type: String, default: 'FacilityPro' },
  companyName: { type: String, default: 'FacilityPro Enterprise Services Pvt. Ltd.' },
  supportPhone: { type: String, default: '+91 98765 43210' },
  supportEmail: { type: String, default: 'contact@facilitypro.com' },
  companyAddress: { type: String, default: '123 Corporate Park, Phase 4, Cyber City, Gurugram, India' }
}, { timestamps: true });

module.exports = mongoose.model('AppSettings', appSettingsSchema);
