import 'dart:convert';

import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/model/transaction/transaction_history_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:get/get.dart';

class TransactionHistoryController extends GetxController {
  var currentIndex = 0.obs;

  final List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/OffersBanners%2Foffer_img1.png?alt=media&token=ccdd4d10-8da2-4de3-b942-ee4512e98d30",
    "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/OffersBanners%2Foffer_img2.png?alt=media&token=53ba165f-3976-482e-8520-ec75b2b418b0",
    "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/OffersBanners%2Foffer_img3.png?alt=media&token=beef4fba-aa51-4980-b61f-9416cdb528d4",
    "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/OffersBanners%2Foffer_img4.png?alt=media&token=ed796c43-b227-4381-ab2e-32667224b96d",
    "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/OffersBanners%2Foffer_img5.png?alt=media&token=c1542307-6d1a-48d5-ad9e-354483547b21"
  ];

  var isLoading = false.obs;
  var transactionList = <TransactionHistorylist>[].obs;

  
  CommonApiRepo repoClass = CommonApiRepo();

   
  Future<void> fetchTransactions() async {
    try {
      isLoading.value = true;

      TransactionHistoryRequestModel request = TransactionHistoryRequestModel(
        mobile: SessionManager().getMobile(),
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      );

      TransactionHistoryResponseModel response =
          await repoClass.apiClient.transaction(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request,
      );

      if (response.status.toString() == "1") {
        print('Response: ${jsonEncode(response)}');
      }

      if (response.transaction_list != null) {
        transactionList.assignAll(response.transaction_list!);
      } else {
        print('Transaction list is null');
        transactionList.clear();
      }
    } catch (e) {
      print("Error fetching transactions: $e");
    } finally {
      isLoading.value = false;
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchTransactions();
  }
}
