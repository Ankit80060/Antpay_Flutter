import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/model/loan_model/AllLoanModel.dart';
import 'package:antpay_lite/model/loan_model/BrandModel.dart';
import 'package:antpay_lite/model/loan_model/LoadDisbursementRequest.dart';
import 'package:antpay_lite/model/loan_model/RTO.dart';
import 'package:antpay_lite/model/loan_model/VechileModel.dart';
import 'package:antpay_lite/model/place_model/occupation_model.dart';

import 'package:antpay_lite/model/loan_model/credit_score_request_model.dart';
import 'package:antpay_lite/model/loan_model/credit_score_response_model.dart';
import 'package:antpay_lite/model/loan_model/state_model.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:dio/dio.dart';

class LoanFormRepo extends CommonApiRepo {
  Future<Occupation> fetchOccupations(String oAuthToken, String auth) async {
    try {
      Occupation occupationResponse =
          await p2pApiClient.getOccupations();

      return occupationResponse;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<BrandModel> fetchBrands() async {
    try {
      BrandModel response = await apiClient.getBrands();
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error in fetchBrands");
    } catch (e) {
      throw Exception("Error in fetchBrands: $e");
    }
  }

  Future<List<StateData>> fetchStatesForCar() async {
    try {
      final response = await apiClient.getStatesForCar();
      if (response.status == 1) {
        return response.data;
      } else {
        throw Exception("API error: ${response.message}");
      }
    } on DioException catch (e) {
      throw Exception(
          e.response?.data ?? "Unknown API error in fetchStatesForCar");
    } catch (e) {
      throw Exception("Unexpected error in fetchStatesForCar: $e");
    }
  }

  Future<VehcileData> fetchMotorModelBrand(String manufacturer) async {
    try {
      VehcileData response = await apiClient.getMotorModelBrand(manufacturer);
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<RtoResponse> fetchRTOFromStates(String state) async {
    try {
      RtoResponse response = await apiClient.getRTOFromStates(state);
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future getMyLoans(String oAuthToken, String authToken,
      LoadDisbursementRequest request) async {
    try {
      AllLoansModel response =
          await apiClient.getMyLoans(oAuthToken, authToken, request);
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error in getMyLoans");
    } catch (e) {
      throw Exception("Error in getMyLoans: $e");
    }
  }

  Future<CreditScoreResponse> getCreditScore(
    String oathToken,
    String authorization,
    CreditScoreRequest data,
  ) async {
    return await apiClient1.getCreditScore(
      AppConstant.secret,
      AppConstant.client_id,
      oathToken,
      authorization,
      data,
    );
  }
}
