

import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:dio/dio.dart';

import '../../../model/antPayCard/transaction_history_response_model.dart';
import '../../../model/transaction/transaction_history_model.dart';
import '../../../model/transaction/transaction_response_model.dart';

class TransactionRepo extends CommonApiRepo {
  Future<TransactionResponseModel> fetchTransactionDetails(
      String oAuthToken, String authToken,
      {required TransactionRequestModel request}) async {
    try {
      return await apiClient.transactiondetails(oAuthToken.trim(), authToken.trim(), request);
    } catch (e) {
      throw Exception("Transaction Error: $e");
    }
  }



  getCardHistoryApi(String oAuthToken, String authToken,
      {required CustomerTransactionHistoryRequestModel request}) async {
    try {
      var response = await apiClient.cardHistory(
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
