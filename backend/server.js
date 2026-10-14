const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const path = require('path');
const connectDB = require('./config/db');

// Models
const Service = require('./models/Service');
const Industry = require('./models/Industry');
const Project = require('./models/Project');
const FAQ = require('./models/FAQ');
const JobOpening = require('./models/JobOpening');
const ContactSubmission = require('./models/ContactSubmission');
const QuoteSubmission = require('./models/QuoteSubmission');
const CareerApplication = require('./models/CareerApplication');

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

// Serve static admin dashboard from 'public' folder
app.use(express.static(path.join(__dirname, 'public')));

// Connect DB if MongoDB URI available
connectDB();

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
app.post('/api/contact', async (req, res) => {
  try {
    const submission = new ContactSubmission(req.body);
    await submission.save();
    res.status(201).json({ success: true, message: 'Contact enquiry saved successfully', data: submission });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
});

// 7. POST Quote Submission
app.post('/api/quotes', async (req, res) => {
  try {
    const quote = new QuoteSubmission(req.body);
    await quote.save();
    res.status(201).json({ success: true, message: 'Quote request saved successfully', data: quote });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
});

// 8. POST Career Application
app.post('/api/careers', async (req, res) => {
  try {
    const application = new CareerApplication(req.body);
    await application.save();
    res.status(201).json({ success: true, message: 'Career application saved successfully', data: application });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
});

// --- ADMIN ENDPOINTS FOR DASHBOARD ---

// GET All Quote Submissions
app.get('/api/admin/quotes', async (req, res) => {
  try {
    const quotes = await QuoteSubmission.find().sort({ createdAt: -1 });
    res.json(quotes);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// GET All Contact Submissions
app.get('/api/admin/contacts', async (req, res) => {
  try {
    const contacts = await ContactSubmission.find().sort({ createdAt: -1 });
    res.json(contacts);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// GET All Career Applications
app.get('/api/admin/careers', async (req, res) => {
  try {
    const applications = await CareerApplication.find().sort({ createdAt: -1 });
    res.json(applications);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`FacilityPro Backend & Admin Dashboard running on http://localhost:${PORT}`);
});
