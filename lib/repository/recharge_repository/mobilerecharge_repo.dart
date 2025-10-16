import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/model/recharge_model/complain_status_bean.dart';
import 'package:antpay_lite/model/recharge_model/fetchplan_list_dth_model.dart';
import 'package:antpay_lite/model/recharge_model/fetchplan_list_model.dart';
import 'package:antpay_lite/model/recharge_model/mobile_number_check_model.dart';
import 'package:antpay_lite/model/recharge_model/operator_list_model.dart';
import 'package:antpay_lite/model/recharge_model/post_complain.dart';
import 'package:dio/dio.dart';

class MobileRechargeRepo extends CommonApiRepo {
  Future<dynamic> checkMobileNumber(String oAuthToken, String auth,
      MobileNumberCheckRequestModel data) async {
    try {
      final response = await apiClient.checkMobile(oAuthToken, auth, data);
      return response; // Returns MobileNumberCheckResponseModel
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? 'Unknown API error');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<dynamic> fetchOperator(
    String oAuthToken,
    String auth,
  ) async {
    try {
      final response = await apiClient.getOperators(oAuthToken, auth);

      return response; // Returns OperatorListResponseModel
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }


  Future<dynamic> fetchCircle(
    String oAuthToken,
    String auth,
  ) async {
    try {
      final response = await apiClient.getCircles(oAuthToken, auth);

      return response; // Returns CircleListResponseModel
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<dynamic> fetchplanapi(
      fetchPlanRequestModel data, String string, String authToken) async {
    try {
      fetchplan_list_model stateResponse =
          await apiClient.fetchPlan(string, authToken, data);
      return stateResponse;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<OperatorList> getOperatorsdth(String oAuthToken, String auth) async {
    try {
      OperatorList operatorResponse =
          await apiClient.getOperatorsdth(oAuthToken, auth);
      return operatorResponse;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Dio error occurred");
    } catch (e) {
      throw Exception("Error fetching DTH operators: $e");
    }
  }

  Future<dynamic> fetchplanapidth(
      fetchPlanRequestModeldth data, String string, String authToken) async {

    try {
      fetchplan_list_dth_model stateResponse =
          await apiClient.fetchPlandth(string, authToken, data);
      return stateResponse;
    } catch (e) {
      print('Error fetching DTH plans: $e');
      throw Exception('Error fetching DTH plans: $e');
    }
  }

  Future<dynamic> getComplainStatus(
    String authToken,
    String oauthToken,
    Map<String, dynamic> dataPost,
  ) async {
    try {
      ComplainStatusBean response = await apiClient.getComplainStatus(
        authToken,
        oauthToken,
        dataPost,
      );
      return response;
    } catch (e) {
      print('Error fetching complaint status: $e');
      throw Exception('Error fetching complaint status: $e');
    }
  }

  Future<PostComplain> submitComplaintApi(
      PostComplain requestData, String authToken, String oathToken) async {
    try {
      // Call the API using your ApiClient
      PostComplain response =
          await apiClient.getComplain(authToken, oathToken, requestData);
      return response;
    } catch (e) {
      print('Error submitting complaint: $e');
      throw Exception('Error submitting complaint: $e');
    }
  }
}
