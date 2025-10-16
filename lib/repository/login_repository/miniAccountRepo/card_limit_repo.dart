import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:dio/dio.dart';

import '../../../model/payment/limit_update_request_model.dart';
import '../../../model/transaction/fetch_card_limit_model.dart';
import '../../../model/transaction/transaction_profile_model.dart';


class CardLimitRepo extends CommonApiRepo {
  

  

   Future<dynamic> getCardLimitApi(
      String oAuthToken, String auth, FetchCardLimitReqModel request) async {
    try {
      FetchCardLimitResModel response =
          await apiClient.cardCardLimit(oAuthToken, auth,request);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

   Future<dynamic> transactionProfileApi(
      String oAuthToken, String auth, TransactionProfileRequestModel request) async {
    try {
      TransactionStatusResponseModel response =
          await apiClient.transactionProfile(oAuthToken, auth,request);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

 Future<dynamic> updateCardLimitApi(
      String oAuthToken, String auth, LimitUpdateRequest request) async {
    try {
      LimitUpdateResponse response =
          await apiClient.updateCardLimit(oAuthToken, auth,request);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
  

}