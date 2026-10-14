import '../models/service_model.dart';
import '../models/industry_model.dart';
import '../models/project_model.dart';
import '../models/faq_model.dart';
import '../models/job_model.dart';
import '../models/contact_model.dart';
import '../models/quote_model.dart';
import '../providers/api_provider.dart';

class FacilityRepository {
  final ApiProvider _apiProvider;

  FacilityRepository(this._apiProvider);

  Future<List<ServiceModel>> fetchServices() async {
    try {
      final response = await _apiProvider.getServices();
      if (response is List) {
        return response.map((e) => ServiceModel.fromJson(e)).toList();
      }
    } catch (_) {
      // Return initial offline mock data when server is unavailable
    }
    return _getMockServices();
  }

  Future<List<IndustryModel>> fetchIndustries() async {
    try {
      final response = await _apiProvider.getIndustries();
      if (response is List) {
        return response.map((e) => IndustryModel.fromJson(e)).toList();
      }
    } catch (_) {}
    return _getMockIndustries();
  }

  Future<List<ProjectModel>> fetchProjects() async {
    try {
      final response = await _apiProvider.getProjects();
      if (response is List) {
        return response.map((e) => ProjectModel.fromJson(e)).toList();
      }
    } catch (_) {}
    return _getMockProjects();
  }

  Future<List<FaqModel>> fetchFaqs() async {
    try {
      final response = await _apiProvider.getFaqs();
      if (response is List) {
        return response.map((e) => FaqModel.fromJson(e)).toList();
      }
    } catch (_) {}
    return _getMockFaqs();
  }

  Future<List<JobModel>> fetchJobs() async {
    try {
      final response = await _apiProvider.getJobs();
      if (response is List) {
        return response.map((e) => JobModel.fromJson(e)).toList();
      }
    } catch (_) {}
    return _getMockJobs();
  }

  Future<bool> submitContact(ContactModel contact) async {
    await _apiProvider.submitContact(contact);
    return true;
  }

  Future<bool> submitQuote(QuoteModel quote) async {
    await _apiProvider.submitQuote(quote);
    return true;
  }

  // Initial Seed Data
  List<ServiceModel> _getMockServices() {
    return [
      ServiceModel(
        id: '1',
        title: 'Integrated Facility Management',
        category: 'Core IFM',
        summary: 'End-to-end management of property infrastructure, operations, and technical assets.',
        description:
            'FacilityPro Integrated Facility Management (IFM) combines all property support operations into a unified management framework. We optimize operational efficiency, streamline vendor contracts, reduce overhead costs, and elevate tenant satisfaction.',
        capabilities: [
          '24/7 Command Center & Helpdesk Operations',
          'Asset Lifecycle & Preventive Maintenance Planning',
          'Vendor Management & SLA Enforcement',
          'EHS (Environment, Health & Safety) Compliance',
          'Space Planning & Move Management'
        ],
        benefits: [
          'Up to 20% reduction in operational expenditure',
          'Maximized equipment uptime & extended asset lifespan',
          'Single point of accountability for all facility tasks',
          'Real-time digital analytics and incident management'
        ],
        imageUrl:
            'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=800&q=80',
        iconName: 'business',
        isFeatured: true,
      ),
      ServiceModel(
        id: '2',
        title: 'Soft Services',
        category: 'Environmental & Hospitality',
        summary: 'High-standard housekeeping, pest control, waste management, and office hospitality.',
        description:
            'Our Soft Services prioritize hygiene, cleanliness, and wellness in commercial and residential spaces. We employ trained personnel, eco-friendly green chemicals, and robotic cleaning tools to deliver immaculate environments.',
        capabilities: [
          'Mechanized Housekeeping & Deep Sanitization',
          'Eco-friendly Integrated Pest Management',
          'Façade & High-rise Window Cleaning',
          'Waste Management & Organic Composting',
          'Pantry & Front Desk Concierge Support'
        ],
        benefits: [
          'Hygienic work environment boosting employee productivity',
          'Compliance with global OSHA and environmental standards',
          'Trained and background-verified professional workforce'
        ],
        imageUrl:
            'https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&w=800&q=80',
        iconName: 'cleaning_services',
        isFeatured: true,
      ),
      ServiceModel(
        id: '3',
        title: 'Engineering & MEP Services',
        category: 'Technical Engineering',
        summary: 'Operation & maintenance of HVAC, Electrical, Plumbing, and Fire Safety Systems.',
        description:
            'FacilityPro delivers technical expertise to ensure continuous electrical supply, optimal HVAC cooling, fire protection readiness, and sustainable plumbing systems across critical commercial installations.',
        capabilities: [
          'HVAC Chiller & Air Handling Unit (AHU) Overhauls',
          'Electrical Substation & DG Set Operation',
          'Fire Alarm & Suppression System Audits',
          'Plumbing, Sewage Treatment (STP) & Water Quality Management',
          'Building Automation System (BAS/BMS) Monitoring'
        ],
        benefits: [
          'Zero unplanned downtime in critical power and cooling',
          'Energy optimization reducing utility bills',
          'Compliance with National Building Code (NBC)'
        ],
        imageUrl:
            'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?auto=format&fit=crop&w=800&q=80',
        iconName: 'engineering',
        isFeatured: true,
      ),
      ServiceModel(
        id: '4',
        title: 'Healthcare Facility Support',
        category: 'Specialized Healthcare',
        summary: 'Specialized hospital infection control, cleanroom maintenance, and biomedical waste care.',
        description:
            'FacilityPro provides specialized healthcare facility maintenance designed for hospitals, laboratories, and clinics. We focus on zero infection risk, sterile environment maintenance, and biomedical safety.',
        capabilities: [
          'ICU & Operation Theatre (OT) Bio-Decontamination',
          'NABH Standard Infection Control Compliance',
          'Biomedical Waste Segregation & Disposal',
          'Medical Gas Pipeline System (MGPS) Monitoring',
          'Sterile Area Housekeeping & Sanitization'
        ],
        benefits: [
          'NABH accreditation audit readiness',
          'Reduced Hospital-Acquired Infections (HAIs)',
          'Trained staff adhering to medical safety protocols'
        ],
        imageUrl:
            'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&w=800&q=80',
        iconName: 'local_hospital',
        isFeatured: true,
      ),
    ];
  }

  List<IndustryModel> _getMockIndustries() {
    return [
      IndustryModel(
        id: '1',
        name: 'Commercial Offices',
        description: 'IT Parks, Corporate HQ, and Shared Workspaces.',
        iconName: 'domain',
        imageUrl: 'https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=800&q=80',
      ),
      IndustryModel(
        id: '2',
        name: 'Shopping Malls & Retail',
        description: 'Footfall management, escalator safety, and public amenities.',
        iconName: 'shopping_bag',
        imageUrl: 'https://images.unsplash.com/photo-1519567241046-7f570eee3ce6?auto=format&fit=crop&w=800&q=80',
      ),
      IndustryModel(
        id: '3',
        name: 'Hospitals & Healthcare',
        description: 'NABH certified cleaning, medical infrastructure, and OT support.',
        iconName: 'local_hospital',
        imageUrl: 'https://images.unsplash.com/photo-1586773860418-d37222d8fce3?auto=format&fit=crop&w=800&q=80',
      ),
      IndustryModel(
        id: '4',
        name: 'Residential Complexes',
        description: 'Gated community management, clubhouse maintenance, and security.',
        iconName: 'apartment',
        imageUrl: 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?auto=format&fit=crop&w=800&q=80',
      ),
      IndustryModel(
        id: '5',
        name: 'Hotels & Hospitality',
        description: 'Guest room maintenance, luxury spa upkeep, and banquet facilities.',
        iconName: 'hotel',
        imageUrl: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80',
      ),
      IndustryModel(
        id: '6',
        name: 'Educational Institutions',
        description: 'Campus hygiene, sports facility care, and student security.',
        iconName: 'school',
        imageUrl: 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&w=800&q=80',
      ),
    ];
  }

  List<ProjectModel> _getMockProjects() {
    return [
      ProjectModel(
        id: '1',
        name: 'CyberTech Innovation Tower',
        location: 'Cyber City, Gurugram',
        industry: 'Commercial Offices',
        servicesProvided: ['Integrated Facility Management', 'Engineering & MEP Services'],
        description: 'Complete 1.2 million sq. ft. Grade-A commercial tower IFM management with 99.9% uptime for data systems.',
        imageUrl: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=800&q=80',
      ),
      ProjectModel(
        id: '2',
        name: 'Apex Super-Specialty Hospital',
        location: 'Noida, Delhi NCR',
        industry: 'Hospitals & Healthcare',
        servicesProvided: ['Healthcare Facility Support', 'Soft Services'],
        description: 'A 500-bed hospital facility management incorporating infection control and critical medical gas pipeline maintenance.',
        imageUrl: 'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&w=800&q=80',
      ),
      ProjectModel(
        id: '3',
        name: 'Grand Galleria Mall',
        location: 'Bengaluru, Karnataka',
        industry: 'Shopping Malls & Retail',
        servicesProvided: ['Soft Services', 'Engineering & MEP Services'],
        description: 'Mechanized housekeeping and MEP management for 800,000 sq. ft. high-footfall shopping mall space.',
        imageUrl: 'https://images.unsplash.com/photo-1519567241046-7f570eee3ce6?auto=format&fit=crop&w=800&q=80',
      ),
    ];
  }

  List<FaqModel> _getMockFaqs() {
    return [
      FaqModel(
        id: '1',
        question: 'What is Integrated Facility Management (IFM)?',
        answer: 'IFM consolidates all facility services—including hard engineering maintenance, soft housekeeping, security, and administrative helpdesk—under a single management provider and unified contract.',
        category: 'General',
      ),
      FaqModel(
        id: '2',
        question: 'How quickly can FacilityPro mobilize operations for a new property?',
        answer: 'Mobilization generally takes 2 to 4 weeks depending on facility size, asset inventory, and staff onboarding requirements. Emergency transitions can be completed in 7 days.',
        category: 'Operations',
      ),
      FaqModel(
        id: '3',
        question: 'Are FacilityPro technicians certified and verified?',
        answer: 'Yes, all technical staff undergo background verification, police checks, and undergo continuous safety and technical training programs.',
        category: 'Staffing',
      ),
      FaqModel(
        id: '4',
        question: 'How do I request a custom quotation for my property?',
        answer: 'You can submit a request through the "Request a Quote" form in this app, or call our team directly at +91 98765 43210. We conduct an initial site audit within 24 hours.',
        category: 'Quotes',
      ),
    ];
  }

  List<JobModel> _getMockJobs() {
    return [
      JobModel(
        id: '1',
        title: 'Facility Manager (Commercial)',
        location: 'Gurugram, HR',
        experience: '5-8 Years',
        department: 'Operations',
        employmentType: 'Full-Time',
        description: 'Lead day-to-day facility operations, client relations, and vendor SLAs for a 500k sq. ft. corporate office campus.',
        requirements: [
          'Degree/Diploma in Engineering or Hotel Management',
          'Proven experience in managing commercial real estate IFM',
          'Strong knowledge of HVAC, Electrical systems, and client reporting'
        ],
      ),
      JobModel(
        id: '2',
        title: 'MEP Shift Engineer',
        location: 'Noida, UP',
        experience: '3-5 Years',
        department: 'Technical Engineering',
        employmentType: 'Full-Time',
        description: 'Oversee electrical, HVAC chiller plant, DG sets, and plumbing operations during shift duty.',
        requirements: [
          'B.Tech or Diploma in Electrical/Mechanical Engineering',
          'Valid High Voltage (HV) License is preferred',
          'Hands-on experience with BMS and Chiller plants'
        ],
      ),
      JobModel(
        id: '3',
        title: 'Soft Services Executive',
        location: 'Bengaluru, KA',
        experience: '2-4 Years',
        department: 'Housekeeping & Hospitality',
        employmentType: 'Full-Time',
        description: 'Supervise housekeeping team, inspect site hygiene, and manage chemical & equipment inventory.',
        requirements: [
          'Degree/Diploma in Hotel Management or Hospitality',
          'Knowledge of mechanized cleaning machines (scrubbers, vacuum cleaners)',
          'Good team management and communication skills'
        ],
      ),
    ];
  }
}
