import '../utils/app_urls.dart';
import '../utils/network/BaseApiService.dart';
import '../utils/network/NetworkApiService.dart';

class OtpRepository {
  final BaseApiService _apiService = NetworkApiService();

   Future<dynamic> sendotp(dynamic data) async {
    try {
      dynamic apiResponse =
          await _apiService.getPostApiResponse(AppUrls.endPoint, data);
      return apiResponse;
    } catch (e) {
      rethrow;
    }
  }
}
