const mongoose = require('mongoose');

const connectDB = async () => {
  try {
    const conn = await mongoose.connect(process.env.MONGO_URI || 'mongodb://127.0.0.1:27017/facilitypro_db');
    console.log(`MongoDB Connected: ${conn.connection.host}`);
  } catch (error) {
    console.warn(`[Warning] MongoDB not connected: ${error.message}`);
    console.warn(`[Info] Backend running in standalone API mode. To connect DB, start MongoDB service or set MONGO_URI.`);
  }
};

module.exports = connectDB;
