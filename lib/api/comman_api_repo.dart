import 'package:antpay_lite/api/api_client.dart';
import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/lend_social_client.dart';
import 'package:antpay_lite/model/AccountTransfer/CustomerFundTransferRequest.dart';
import 'package:antpay_lite/model/AccountTransfer/VerifyW2ACredentialsRequest.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_account_beneficiary_request.dart';
import 'package:antpay_lite/model/Mpin/SetMpinModel.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';

import 'package:antpay_lite/api/api_client1.dart';
import 'package:antpay_lite/api/p2p_api_client.dart';
import 'package:antpay_lite/model/payment/PayUHashResponse.dart';
import 'package:antpay_lite/model/payment/PayUStringHash.dart';
import 'package:antpay_lite/model/payment/customer_load_balance.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:dio/dio.dart';

class CommonApiRepo {
  late APIClient apiClient;
  late P2PApiClient p2pApiClient;
  late LenSocialApiClient lenSocialApiClient;
  late APIClient1 apiClient1;

  CommonApiRepo() {
    Dio dio = Dio(
      BaseOptions(
  
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        receiveDataWhenStatusError: true,
        responseType: ResponseType.plain,
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
         validateStatus: (status) {
      return status != null && status < 500;
    },
      ),
    );
    dio.options.preserveHeaderCase = true;

    dio.options.preserveHeaderCase = true;
    dio.interceptors.addAll([
      LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          // responseHeader: true,
          responseBody: true,
          error: true,
          logPrint: (obj) => print("🔹 $obj")),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      )
    ]);

    apiClient = APIClient(dio);
    p2pApiClient = P2PApiClient(dio);
    lenSocialApiClient = LenSocialApiClient(dio);
    apiClient1 = APIClient1(dio);
  }

  Future<dynamic> getPayuHash(
      PayUStringHash data, String string, String authToken) async {
    PayUHashResponse hashResponse =
        await apiClient.getPayuHash(string, authToken, data);
    return hashResponse;
  }

  Future<dynamic> customerLoadBalance(
      String auth, String oAuthToken, CustomerLoadbalanceRequest data) async {
    var response = await apiClient.customerloadaccount(auth, oAuthToken, data);
    return response.toString();
  }

  Future<dynamic> send2FAOtp(Map<String, dynamic> data, String action) async {
    final response = await apiClient.send2FAOtp(
        SessionManager().getToken().toString(), AuthToken.getAuthToken(), data);
    return response;
  }

  Future<dynamic> verifyW2ACredential(VerifyW2ACredentialsRequest data) async {
    final response = await apiClient.verifyW2ACredential(
        SessionManager().getToken().toString(), AuthToken.getAuthToken(), data);
    return response;
  }

  Future<dynamic> processW2ATransfer(
      CustomerAccountBeneficiaryRequest data) async {
    final response = await apiClient.processW2ATransfer(
        SessionManager().getToken().toString(), AuthToken.getAuthToken(), data);
    return response;
  }

  Future<dynamic> setMpin(SetMPinRequest data) async {
    final response = await apiClient.setMpin(
        SessionManager().getToken().toString(), AuthToken.getAuthToken(), data);
    return response;
  }


}
