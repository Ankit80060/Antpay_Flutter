
import 'package:antpay_lite/utils/app_urls.dart';
import 'package:antpay_lite/utils/network/BaseApiService.dart';
import 'package:antpay_lite/utils/network/NetworkApiService.dart';


class LoginRepository {
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

  Future<dynamic> fetchUser(dynamic data) async {
    try {
      dynamic apiResponse =
          await _apiService.getPostApiResponse(AppUrls.endPointFetchUser, data);
      return apiResponse;
    } catch (e) {
      rethrow;
    }
  }

  // void testSubmit(String msg, BuildContext context) {
  //   CommonUtils.showFlushBar(msg, context);
  // }
}
