const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const path = require('path');
const helmet = require('helmet');
const mongoSanitize = require('express-mongo-sanitize');
const rateLimit = require('express-rate-limit');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const connectDB = require('./config/db');
const verifyToken = require('./middleware/auth');

// Models
const Service = require('./models/Service');
const Industry = require('./models/Industry');
const Project = require('./models/Project');
const FAQ = require('./models/FAQ');
const JobOpening = require('./models/JobOpening');
const ContactSubmission = require('./models/ContactSubmission');
const QuoteSubmission = require('./models/QuoteSubmission');
const CareerApplication = require('./models/CareerApplication');
const AdminUser = require('./models/AdminUser');

dotenv.config();
const app = express();

// Security Middlewares
app.use(helmet({ contentSecurityPolicy: false })); // Apply HTTP security headers
app.use(mongoSanitize()); // Prevent NoSQL Injection attacks
app.use(cors());
app.use(express.json({ limit: '10mb' })); // Body parser with limit

// Rate Limiter for Submission APIs (Max 20 requests per 15 minutes per IP)
const submissionLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 20,
  message: { success: false, message: 'Too many requests from this IP. Please try again later.' },
});

// Serve static admin dashboard from 'public' folder
app.use(express.static(path.join(__dirname, 'public')));

// Connect DB & Seed Admin User
connectDB().then(async () => {
  try {
    const adminExists = await AdminUser.findOne({ username: 'admin' });
    if (!adminExists) {
      const salt = await bcrypt.genSalt(10);
      const hashedPassword = await bcrypt.hash('admin123', salt);
      await AdminUser.create({
        username: 'admin',
        passwordHash: hashedPassword,
        email: 'admin@facilitypro.com',
        role: 'Admin'
      });
      console.log('[Security] Seeded default Admin user (username: admin, password: admin123)');
    }
  } catch (err) {
    console.error('Admin seeding error:', err.message);
  }
});

// --- PUBLIC APIS FOR MOBILE APP ---

// 1. GET Services
app.get('/api/services', async (req, res) => {
  try {
    const services = await Service.find();
    res.json(services);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// 2. GET Industries
app.get('/api/industries', async (req, res) => {
  try {
    const industries = await Industry.find();
    res.json(industries);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// 3. GET Projects
app.get('/api/projects', async (req, res) => {
  try {
    const projects = await Project.find();
    res.json(projects);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// 4. GET FAQs
app.get('/api/faqs', async (req, res) => {
  try {
    const faqs = await FAQ.find();
    res.json(faqs);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// 5. GET Jobs
app.get('/api/jobs', async (req, res) => {
  try {
    const jobs = await JobOpening.find({ isOpen: true });
    res.json(jobs);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// 6. POST Contact Submission
app.post('/api/contact', submissionLimiter, async (req, res) => {
  try {
    const submission = new ContactSubmission(req.body);
    await submission.save();
    res.status(201).json({ success: true, message: 'Contact enquiry saved successfully', data: submission });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
});

// 7. POST Quote Submission
app.post('/api/quotes', submissionLimiter, async (req, res) => {
  try {
    const quote = new QuoteSubmission(req.body);
    await quote.save();
    res.status(201).json({ success: true, message: 'Quote request saved successfully', data: quote });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
});

// 8. POST Career Application
app.post('/api/careers', submissionLimiter, async (req, res) => {
  try {
    const application = new CareerApplication(req.body);
    await application.save();
    res.status(201).json({ success: true, message: 'Career application and resume saved to MongoDB successfully', data: application });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
});

// --- SECURE ADMIN APIS ---

// POST Admin Login
app.post('/api/admin/login', async (req, res) => {
  try {
    const { username, password } = req.body;
    if (!username || !password) {
      return res.status(400).json({ success: false, message: 'Username and password are required.' });
    }

    const admin = await AdminUser.findOne({ username });
    if (!admin) {
      return res.status(401).json({ success: false, message: 'Invalid admin credentials.' });
    }

    const isMatch = await admin.comparePassword(password);
    if (!isMatch) {
      return res.status(401).json({ success: false, message: 'Invalid admin credentials.' });
    }

    const token = jwt.sign(
      { id: admin._id, username: admin.username, role: admin.role },
      process.env.JWT_SECRET || 'facilitypro_super_secret_jwt_key_2026',
      { expiresIn: '24h' }
    );

    res.json({
      success: true,
      message: 'Admin login successful',
      token,
      admin: { username: admin.username, email: admin.email, role: admin.role }
    });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
});

// GET All Quote Submissions (Protected)
app.get('/api/admin/quotes', verifyToken, async (req, res) => {
  try {
    const quotes = await QuoteSubmission.find().sort({ createdAt: -1 });
    res.json(quotes);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// GET All Contact Submissions (Protected)
app.get('/api/admin/contacts', verifyToken, async (req, res) => {
  try {
    const contacts = await ContactSubmission.find().sort({ createdAt: -1 });
    res.json(contacts);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// GET All Career Applications (Protected)
app.get('/api/admin/careers', verifyToken, async (req, res) => {
  try {
    const applications = await CareerApplication.find().sort({ createdAt: -1 });
    res.json(applications);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`FacilityPro Secure Backend & Admin Dashboard running on http://localhost:${PORT}`);
});
