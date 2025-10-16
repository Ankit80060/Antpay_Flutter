import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/auth_token.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../model/creditCard/credit_card_model.dart';
import '../../prefrences/session_manager.dart';
import '../../repository/credit_card_repository/credit_card_repo.dart';

class CreditCardDetailsController extends GetxController {
  CreditCardRepo repository = CreditCardRepo();

  RxBool loading = false.obs;

  RxString getId = "".obs;

  RxList<CreditCardModel> creditCardDetails = <CreditCardModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null && Get.arguments["creditCardId"] !="") {
      getId.value = Get.arguments["creditCardId"];
    fetchCreditCardData(Get.arguments["creditCardId"]);

    }

  }

  Future<void> fetchCreditCardData(id) async {
    loading.value = true;
    try {
      CreditCardResponse response = await repository.getCreditCard(
        AuthToken.getAuthToken(),
        SessionManager().getToken().toString(),
        id
      );

      if (response.status.toString() == '1') {
        if (response.data != null) {
          creditCardDetails.assignAll(response.data!);
        } else {
          creditCardDetails.clear();
        }
      } else {
        creditCardDetails.clear();
        CustomToast.show(response.msg ?? "");
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      loading.value = false;
    }
  }
}
