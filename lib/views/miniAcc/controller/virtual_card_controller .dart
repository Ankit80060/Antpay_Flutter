
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:payu_ppi_flutter/payu_ppi_flutter.dart';
import 'package:payu_ppi_flutter/PayUConstantKeys.dart';
import 'dart:convert';

import '../../../custom_widget/custom_toast_msg.dart';

class VirtualCardController extends GetxController implements PayUPPIProtocol {
  late PayUPPIFlutter _ppi;

  @override
  void onInit() {
    super.onInit();
    _ppi = PayUPPIFlutter(this);
  }

 

  /// Params for PayU SDK
  Map<String, String> getPayUParams() {
     var payUParams = {
      PayUPPIParamKey.merchantKey: AppConstant.merchantKey,
      PayUPPIParamKey.referenceId: "payu${DateTime.now().millisecondsSinceEpoch}", 
      PayUPPIParamKey.walletUrn: SessionManager().getPayUCustomerUrn().toString(),
      PayUPPIParamKey.environment: AppConstant.environment,
      PayUPPIParamKey.walletIdentifier: AppConstant.walletIdentifier,
      PayUPPIParamKey.mobileNumber: SessionManager().getMobile().toString()
    };

    return payUParams;
  }

  /// Trigger PayU SDK screen
  void showVirtualCard() {
    final params = getPayUParams();
   _ppi.showCards(payUPPIParams: params).then((value) {
  }).catchError((error) {
    CustomToast.show("Error showing card");
  });
  }

  // --- Callbacks by PayU ---
   @override
  void generateHash(Map response) async {
    if (response.containsKey(PayUHashConstantsKeys.hashString) &&
        response.containsKey(PayUHashConstantsKeys.hashName)) {
      
      final String hashData = response[PayUHashConstantsKeys.hashString];
      final String hashName = response[PayUHashConstantsKeys.hashName];

      if (kDebugMode) {
        debugPrint("PayU generateHash called → $hashName | $hashData");
      }

      String generateSha512(String input, String salt) {
        final bytes = utf8.encode(input + salt);
        final digest = sha512.convert(bytes);
        return digest.toString();
      }

      final String hash = generateSha512(hashData, AppConstant.prodSaltKey);


      if (hash.isNotEmpty) {
        final Map<String, String> hashMap = {hashName: hash};

        if (kDebugMode) {
          debugPrint("generateHash called hash: $hash");
        }

        _ppi.hashGenerated(hash: hashMap);
      }
    }
  }

  @override
  void onCancel() {
  CustomToast.show("Cancelled card view");


  }

  @override
  void onError(Map? response) {
      CustomToast.show(response.toString());
      print("error $response");
   
  }
}
