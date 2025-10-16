import 'package:antpay_lite/api/api_client.dart';
import 'package:antpay_lite/model/otp_model/otp_model.dart';
import 'package:antpay_lite/utils/method_utils.dart';
import 'package:dio/dio.dart';

class OtpApiRepo {
  late APIClient apiClient;

  OtpApiRepo() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    apiClient = APIClient(dio);
  }

  Future<dynamic> verifyOTP(String mobile, String currOtp) async {
    String? id = await CommonMethodUtils().getId();
    OTPRequestModel dataPost =
        OTPRequestModel(mobile: mobile, otp: currOtp, device_id: id);
    dynamic posResponse = await apiClient.otp(dataPost);
    return posResponse;
  
  }
}
