import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:dio/dio.dart';
import '../../../model/billpay/GetCategoriesBean.dart';
import '../../../model/offer/offer_details_model.dart';
import '../../../model/rewardHostory/coupon_resmodel.dart';
import '../../../model/rewardHostory/point_history_bean.dart';
import '../../../model/transaction/fetch_card_limit_model.dart';
import '../../../model/transaction/transaction_history_model.dart';
import '../../../model/transaction/transaction_response_model.dart';
import '../../../model/wallet/CheckUserRequestModelPayu.dart';
import '../../../model/wallet/CheckUserResponseModelPayu.dart';
import '../../../model/wallet/FetchCardInfoRequestModel.dart';
import '../../../model/wallet/FetchCardInfoResponseModel.dart';
import '../../../model/wallet/GetBankDetailsRequestModel.dart';
import '../../../model/wallet/GetBankDetailsResponseModel.dart';
import '../../../model/wallet/WalletBalanceRequestModel.dart';
import '../../../model/wallet/WalletBalanceResponseModel.dart';
import '../../../model/wallet/point_balance_model.dart';

class MiniAccountRepo extends CommonApiRepo {
  

   Future<dynamic> getBillPaymentApiData(
      String oAuthToken, String auth) async {
    try {
      SchemesInvestmentResonseModel response =
          await apiClient.getCategory(oAuthToken, auth);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

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

    Future<dynamic> getCustomerRecord(
      String oAuthToken, String auth, CheckUserRequestModelPayu data) async {
    try {
      CheckUserResponseModelPayu response =
          await apiClient.checkUser_Payu(oAuthToken, auth, data);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
  Future<dynamic> getPointBalance(
      String oAuthToken, String auth, PointBalanceRequestModel data) async {
    try {
      PointBalanceResponseModel pointBalanceResponse =
          await apiClient.getPointBalance(oAuthToken, auth, data);

      return pointBalanceResponse;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  fetchCouponsData({required Map<String, String?> request}) async {
    try {
      CouponResModel response = await apiClient.getUserCoupon(
        request,
      );

      return response;
    } on DioException catch (e) {
     throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  fetchCoinHistoryData(String oAuthToken, String authToken,
      {required pointHistoryRequestPOJO request}) async {
    try {
      PointHistoryBean historyResModel = await apiClient.pointHistory(
          oAuthToken.trim(), authToken.trim(), request);
      return historyResModel;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  getCategoriesDetails(
    String oAuthToken,
    String authToken,
  ) async {
    try {
      return await apiClient.fetchOfferCategory(
          oAuthToken.trim(), authToken.trim());
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  getCouponOfferByCategory(
      String oAuthToken, String authToken, Map<String, dynamic> request) async {
    try {
      return await apiClient.fetchCouponOfferByCategory(
          oAuthToken.trim(), authToken.trim(), request);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

 


  fetchOfferDetails({required OfferDetailsRequest request}) async {
    try {
      OfferDetailsResponse response =
          await apiClient.fetchOfferDetails(request);
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  

  



  callClaimCouponsApi(String oAuthToken, String authToken,
      {required Map<String, String> request}) async {
    try {
      var response = await apiClient.getPaymentPin(
        oAuthToken.trim(),
        authToken.trim(),
        request,
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  callRewardcoinsOtp(String oAuthToken, String authToken,
      {required Map<String, String> request}) async {
    try {
      var response = await apiClient.getRewardcoinsOtp(
        oAuthToken.trim(),
        authToken.trim(),
        request,
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Server error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
  callVerifyOtpApi(String oAuthToken, String authToken,
      {required Map<String, String> request}) async {
    try {
      var response = await apiClient.getVerifyRewardOtp(
        oAuthToken.trim(),
        authToken.trim(),
        request,
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  }
