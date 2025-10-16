

import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:dio/dio.dart';

import '../../../model/AccountTransfer/VerifyW2ACredentialsRequest.dart';
import '../../../model/Mpin/SetMpinModel.dart';


class WalletSettingRepo extends CommonApiRepo {
  // Future<GetBankDetailsResponseModel> fetchAccountDetails(
  //     String oAuthToken, String authToken,
  //     {required GetBankDetailsRequestModel request}) async {
  //   try {
  //     return await apiClient.fetchAccountInfo(oAuthToken.trim(), authToken.trim(), request);
  //   } catch (e) {
  //     throw Exception("Account Error: $e");
  //   }
  // }

  
  callWalletStatusApi(String oAuthToken, String authToken,
      {required Map<String, dynamic> request}) async {
    try {
      var response = await apiClient.changeWalletStatus(
        oAuthToken.trim(),
        authToken.trim(),
        request,
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Server Error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  callWalletSendOtpApi(String oAuthToken, String authToken,
      {required Map<String, String> request}) async {
    try {
      var response = await apiClient.send2FAOtp(
        oAuthToken.trim(),
        authToken.trim(),
        request,
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Server Error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // callVerifyMpinApi(String oAuthToken, String authToken,
  //     {required VerifyW2ACredentialsRequest request}) async {
  //   try {
  //     var response = await apiClient.verifyW2ACredential(
  //       oAuthToken.trim(),
  //       authToken.trim(),
  //       request,
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     throw Exception(e.response?.data ?? "Server Error");
  //   } catch (e) {
  //     throw Exception("Error: $e");
  //   }
  // }

  
  callWalletSetResetMPinApi(String oAuthToken, String authToken,
      {required SetMPinRequest request}) async {
    try {
      var response = await apiClient.setMpin(
        oAuthToken.trim(),
        authToken.trim(),
        request,
      );
      
      
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Server Error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
