import 'package:dio/dio.dart';

import '../../api/comman_api_repo.dart';
import '../../model/creditCard/credit_card_model.dart';

class CreditCardRepo extends CommonApiRepo {
  Future<CreditCardResponse> getCreditCard(
      String authValue, String oathToken, String? id) async {
    try {
      final response;
      if (id==null) {
         response = await apiClient.fetchCreditCard(authValue, oathToken);
      } else {
         response = await apiClient.fetchCreditCardById(authValue, oathToken,id);
      }

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Server error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }


}
