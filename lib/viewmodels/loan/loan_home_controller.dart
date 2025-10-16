import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/model/loan_model/AllLoanModel.dart';
import 'package:antpay_lite/model/loan_model/LoadDisbursementRequest.dart';
import 'package:antpay_lite/model/loan_model/credit_score_request_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoanHomeController extends GetxController {
  CommonApiRepo repoClass = CommonApiRepo();
  var isLoading = false.obs;
  var loanList = <AllLoansSingleEntity>[].obs;
  var creditScore = "N/A".obs;
  var experianScore = "N/A".obs;
  var activeLoanAccounts = "N/A".obs;
  var creditUtilisation = "N/A".obs;
  var delayedPayments = "N/A".obs;

  @override
  void onInit() {
    super.onInit();
    fetchLoans();
    fetchCreditScore();
  }

  Future<void> fetchCreditScore() async {
    isLoading.value = true;
    try {
      final mobile = SessionManager().getMobile()?.toString();
      final Name = SessionManager().getName()?.toString();
      if (mobile == null || mobile.isEmpty) {
        throw Exception("Mobile number not found");
      }
      final parts = Name?.trim().split(" ");
      final fname = parts!.isNotEmpty ? parts.first : "";
      final lname = parts.length > 1 ? parts.sublist(1).join(" ") : "";
      final oAuthToken = SessionManager().getToken()?.toString() ?? '';
      final authToken = AuthToken.getAuthToken() ?? '';
      final body = CreditScoreRequest(
        fname: lname,
        lname: fname,
        userId: "",
        aParam: "$mobile|${DateTime.now().toIso8601String()}",
        experianSource: "antpay",
        mobileNo: mobile,
        creditScoreRequestType: "free",
      );

      final response = await repoClass.apiClient1.getCreditScore(
        AppConstant.secret,
        AppConstant.client_id,
        oAuthToken,
        authToken,
        body,
      );

      creditScore.value = response.score?.toString() ?? "N/A";
      experianScore.value =
          response.getSavedCreditScore?.data?.score?.toString() ?? "N/A";
      activeLoanAccounts.value =
          response.xmlParseResp?.data?.totalNoOfActiveAccount?.toString() ??
              "N/A";
      creditUtilisation.value =
          response.xmlParseResp?.data?.termCreditToTotalCredit?.toString() ??
              "N/A";
      delayedPayments.value =
          response.xmlParseResp?.data?.numberOfInstancesDelay?.toString() ??
              "N/A";
    } on DioException catch (e) {
      print("Dio Error in fetchCreditScore: ${e.response?.data ?? e.message}");
    } catch (e) {
      print("Error in fetchCreditScore: $e");
    } finally {
      isLoading.value = false;
      print("isLoading: ${isLoading.value}");
    }
  }

  Future<void> fetchLoans() async {
    isLoading.value = true;
    try {
      final mobile = SessionManager().getMobile()?.toString();
      if (mobile == null || mobile.isEmpty) {
        throw Exception("Mobile number not found");
      }
      final oAuthToken = SessionManager().getToken()?.toString() ?? '';
      final authToken = AuthToken.getAuthToken() ?? '';
      final body = LoadDisbursementRequest(mobile: mobile);
      final response =
          await repoClass.apiClient.getMyLoans(oAuthToken, authToken, body);

      loanList.clear();
      if (response.loanList != null) {
        loanList.addAll(response.loanList!.myLoans);
        loanList.addAll(response.loanList!.businessLoans);
      } else {
        print("No loanList in response");
      }
    } on DioException catch (e) {
      print("Dio Error in fetchLoans: ${e.response?.data ?? e.message}");

      loanList.clear();
    } catch (e) {
      print("Error in fetchLoans: $e");
      loanList.clear();
    } finally {
      isLoading.value = false;
      print("isLoading: ${isLoading.value}");
    }
  }
}
