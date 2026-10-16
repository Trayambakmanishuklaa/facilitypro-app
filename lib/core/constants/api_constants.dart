class ApiConstants {
  // Base URL: Render Live Backend URL ending with '/api'
  static const String baseUrl = 'https://facilitypro-backend.onrender.com/api';

  // Endpoints
  static const String services = '$baseUrl/services';
  static const String industries = '$baseUrl/industries';
  static const String projects = '$baseUrl/projects';
  static const String faqs = '$baseUrl/faqs';
  static const String jobs = '$baseUrl/jobs';
  static const String contact = '$baseUrl/contact';
  static const String quote = '$baseUrl/quotes';
  static const String careers = '$baseUrl/careers';

  // Request Timeouts (60 seconds to allow smooth resume base64 uploads)
  static const int timeoutSeconds = 60;
}
