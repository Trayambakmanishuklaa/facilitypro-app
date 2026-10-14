class ApiConstants {
  // Base URL:
  // - Use 'http://10.0.2.2:5000/api' for Android Emulator.
  // - Use 'http://localhost:5000/api' for Real Physical Phone (with `adb reverse tcp:5000 tcp:5000`) or Windows Desktop.
  // - Use 'http://<YOUR_PC_IP>:5000/api' if phone and PC are on the same Wi-Fi.
  static const String baseUrl = 'http://localhost:5000/api';

  // Endpoints
  static const String services = '$baseUrl/services';
  static const String industries = '$baseUrl/industries';
  static const String projects = '$baseUrl/projects';
  static const String faqs = '$baseUrl/faqs';
  static const String jobs = '$baseUrl/jobs';
  static const String contact = '$baseUrl/contact';
  static const String quote = '$baseUrl/quotes';
  static const String careers = '$baseUrl/careers';

  // Request Timeouts
  static const int timeoutSeconds = 15;
}
