import '../../core/constants/api_constants.dart';
import '../../core/network/api_client.dart';
import '../models/contact_model.dart';
import '../models/quote_model.dart';

class ApiProvider {
  final ApiClient _apiClient;

  ApiProvider(this._apiClient);

  Future<dynamic> getServices() async {
    return await _apiClient.get(ApiConstants.services);
  }

  Future<dynamic> getIndustries() async {
    return await _apiClient.get(ApiConstants.industries);
  }

  Future<dynamic> getProjects() async {
    return await _apiClient.get(ApiConstants.projects);
  }

  Future<dynamic> getFaqs() async {
    return await _apiClient.get(ApiConstants.faqs);
  }

  Future<dynamic> getJobs() async {
    return await _apiClient.get(ApiConstants.jobs);
  }

  Future<dynamic> submitContact(ContactModel contact) async {
    return await _apiClient.post(ApiConstants.contact, contact.toJson());
  }

  Future<dynamic> submitQuote(QuoteModel quote) async {
    return await _apiClient.post(ApiConstants.quote, quote.toJson());
  }
}
