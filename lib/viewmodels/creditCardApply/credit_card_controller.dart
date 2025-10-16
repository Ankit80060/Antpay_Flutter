
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/auth_token.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../model/creditCard/credit_card_model.dart';
import '../../prefrences/session_manager.dart';
import '../../repository/credit_card_repository/credit_card_repo.dart';

class CreditCardApplyController extends GetxController{

  CreditCardRepo repository=CreditCardRepo();
    

  RxBool loading= false.obs;
  

  RxList<CreditCardModel> creditCkardData= <CreditCardModel>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchCreditCardData();
  }
  

  Future<void> fetchCreditCardData() async {
    loading.value = true;
    try {
      

      CreditCardResponse response =
          await repository.getCreditCard(
              AuthToken.getAuthToken(),
              SessionManager().getToken().toString(), null
              
              );

      if (response.status.toString() == '1') {
        if (response.data!=null) {
        creditCkardData.assignAll(response.data!);
          
        }else{
          creditCkardData.clear();
        }
      } 
      else {
        creditCkardData.clear();
        CustomToast.show(response.msg ?? "");
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      loading.value = false;
    }
  }
}



