import 'dart:convert';

import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/loan_model/loan_request_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:get/get.dart';

class LoanOfferController extends GetxController {
  final CommonApiRepo repoClass = CommonApiRepo();
  final Rx<Map<String, dynamic>?> loanStatus = Rx<Map<String, dynamic>?>(null);
  final Rx<List<Map<String, dynamic>>?> loanOffers =
      Rx<List<Map<String, dynamic>>?>(null);
  final RxBool isLoadingStatus = true.obs;
  final RxBool isLoadingOffers = false.obs;

  late LoanRequestModel loanRequest;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    loanRequest = args is LoanRequestModel
        ? args
        : LoanRequestModel(userData: UserData());
    fetchLoanData().then((_) {
      print("fetchLoanData completed at ${DateTime.now()}");
    }).catchError((e) {
      print("fetchLoanData error: $e at ${DateTime.now()}");
    });
  }

  Future<void> fetchLoanData() async {
    try {
      if (loanRequest.userData.loanType == '2') {
        await initCarLoanStatus(loanRequest);
      } else {
        await initLoanStatus(loanRequest);
      }
      await initLoanOffer(loanRequest);
    } catch (e) {
      CustomToast.show("Error loading data: $e");
    }
  }

  Future<void> initLoanStatus(LoanRequestModel loanRequestModel) async {
    try {
      isLoadingStatus.value = true;
      final statusResponse = await repoClass.apiClient.getLoanStatus1(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        loanRequestModel,
      );
      Map<String, dynamic>? status;
      if (statusResponse is String) {
        status = jsonDecode(statusResponse) as Map<String, dynamic>;
      } else if (statusResponse is Map<String, dynamic>) {
        status = statusResponse;
      }
      if (status != null && status['status'] == 1) {
        loanStatus.value = status;
      } else {
        loanStatus.value = {'msg': 'Failed to fetch status', 'status': 0};
      }
    } catch (e) {
      CustomToast.show("Error fetching loan status: $e");
    } finally {
      isLoadingStatus.value = false;
    }
  }

  Future<void> initCarLoanStatus(LoanRequestModel loanRequestModel) async {
    try {
      isLoadingStatus.value = true;
      final status = await repoClass.apiClient.getLoanStatus1(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        loanRequestModel,
      );
      if (status != null &&
          status is Map<String, dynamic> &&
          status['status'] == 1) {
        loanStatus.value = status;
      } else {
        loanStatus.value = {
          'msg': 'Failed to fetch car loan status',
          'status': 0
        };
      }
    } catch (e) {
      loanStatus.value = {'msg': 'Error fetching car loan status', 'status': 0};
      CustomToast.show("Error fetching car loan status: $e");
    } finally {
      isLoadingStatus.value = false;
    }
  }

  Future<void> initLoanOffer(LoanRequestModel loanRequestModel) async {
    try {
      isLoadingOffers.value = true;
      final offersResponse = await repoClass.apiClient1.getLoanStatus1(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        loanRequestModel,
      );
      if (offersResponse != null) {
        final String responseText = offersResponse is String
            ? offersResponse
            : jsonEncode(offersResponse);
        final jsonMatch =
            RegExp(r'\{.*\}', multiLine: true).firstMatch(responseText);
        final dynamic parsedResponse =
            jsonMatch != null ? jsonDecode(jsonMatch.group(0) ?? '{}') : null;

        if (parsedResponse != null && parsedResponse is Map<String, dynamic>) {
          final offersList = parsedResponse['UserData'] as List<dynamic>?;
          loanOffers.value = offersList
                  ?.map((item) => item as Map<String, dynamic>)
                  .toList() ??
              [];
        } else {
          loanOffers.value = [];
        }
      } else {
        loanOffers.value = [];
      }
    } catch (e) {
      loanOffers.value = [];
      CustomToast.show("Error fetching loan offers: $e");
    } finally {
      isLoadingOffers.value = false;
    }
  }

  void navigateToLoanVerifyDetails(Map<String, dynamic> loanOffer) {
    loanRequest.userData.min_rate = "${loanOffer["min_int_rate"] ?? 'N/A'}";
    loanRequest.userData.min_loan_amount =
        "${loanOffer["loan_amount_calculate"] ?? 'N/A'}";
    loanRequest.userData.bankName = "${loanOffer["name"] ?? ''}";
    Get.toNamed(RoutesName.loanverifydetailsscreen, arguments: loanRequest);
  }
}
