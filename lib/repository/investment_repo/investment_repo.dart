import 'package:dio/dio.dart';

import '../../api/comman_api_repo.dart';
import '../../model/investment/investment_response.dart';

class InvestmentProductRepo extends CommonApiRepo {
  Future<InvestmentResponse> getInvestmentProduct(
      String authValue, String oathToken) async {
    try {
      final response = await apiClient1.fetchInvestmentProduct(authValue, oathToken);
      

      return response;
    } on DioException catch (e) {
       print("DioException: $e");
     
      throw Exception( "Server error");
    } catch (e) {
       print("Catch error : $e");
     
      throw Exception("Error: $e");
    }
  }


}
