import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/model/billpay/GetCategoriesBean.dart';
import 'package:dio/dio.dart';

import '../../model/billpay/BBPSGetBillerBean.dart';
import '../../model/billpay/BillersLifeInsurance.dart';
import '../../model/billpay/FastageModelbillavenue.dart';
import '../../model/billpay/FetchBillBean.dart';
import '../../model/billpay/bill_pay_request.dart';
import '../../model/billpay/getBiller_inputfields_model.dart';
import '../../model/billpay/getBillers.dart';
import '../../model/billpay/getOperator.dart';
import '../../model/billpay/loan_repayment_biller_model.dart';
import '../../model/recharge_model/convenience_model.dart';
import '../../model/recharge_model/recharge_payu_model.dart';
import '../../model/recharge_model/recharge_status_check.dart';

class BillPayRepo extends CommonApiRepo {
  /// New API call for Categories
  Future<SchemesInvestmentResonseModel> getCategory(
      String authValue, String oathToken) async {
    try {
      final response = await apiClient.getCategory(authValue, oathToken);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<HealthInsuranceResponseModel> fetchBillerName(
      String authValue, String oathToken, reqData) async {
    try {
      HealthInsuranceResponseModel response =
          await apiClient.getBillerName(authValue, oathToken, reqData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<GetBillersServiceRes> fetchBillerServiceName(
      String authValue, String oathToken, reqData) async {
    try {
      GetBillersServiceRes response =
          await apiClient.getServiceName(authValue, oathToken, reqData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

 

  Future<OperatorResponse> fetchOperatordetails(
      String authValue, String oathToken, reqData) async {
    try {
      OperatorResponse response =
          await apiClient.getOperatordetails(authValue, oathToken, reqData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<FetchBillBean> fetchBillerServiceDetails(
      String authValue, String oathToken, reqData) async {
    try {
      FetchBillBean response = await apiClient.getBillerServiceDetails(
          authValue, oathToken, reqData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<BillersLifeInsurance> fetchBillerInputField(
      String authValue, String oathToken, reqData) async {
    try {
      BillersLifeInsurance response =
          await apiClient.getBillerinputfields(authValue, oathToken, reqData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<LoanRepaymentBillerModel> fetchBillDetailsApi(
      String authValue, String oathToken, reqData) async {
    try {
      LoanRepaymentBillerModel response =
          await apiClient.getBillDetails(authValue, oathToken, reqData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<FetchBillBeanFastage> fetchFastagBillDetails(String authValue,
      String oathToken, FastageModelbillavenueModel reqData) async {
    try {
      // Call the Retrofit API
      FetchBillBeanFastage response = await apiClient.getFetchbill(
        authValue,
        oathToken,
        reqData,
      );

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  getFastageFetchbill(FastageModelbillavenueModel request) {}

  Future<BillPayResponse> callPaymentSuccessBillPay(
      String authValue, String oathToken, reqData) async {
    try {
      BillPayResponse response =
          await apiClient.getBillPay(authValue, oathToken, reqData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  


  Future<RechargePayUPaymentRes> callPaymentSuccessRechargePay(
      String authValue, String oathToken, reqData) async {
    try {
      RechargePayUPaymentRes response =
          await apiClient.generateRechargePayUResponse(authValue, oathToken, reqData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<RechargeStatusRes> callCheckRechargeStatusApi(
      String authValue, String oathToken, reqData) async {
    try {
      RechargeStatusRes response =
          await apiClient.checkRechargestatus(authValue, oathToken, reqData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  

  Future<ConvenienceFeeResData> fetchConvenienceFeeApi(
      String authValue, String oathToken, reqData) async {
    try {
      ConvenienceFeeResData response =
          await apiClient.getFeeRates(authValue, oathToken, reqData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Server Error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
