import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/auth_token.dart';
import '../../../custom_widget/custom_toast_msg.dart';
import '../../../custom_widget/customstyles.dart';
import '../../../repository/login_repository/miniAccountRepo/wallet_setting_repo.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/routes/routes_name.dart';

class WalletSettingController extends GetxController {
 WalletSettingRepo wallet_repository = WalletSettingRepo();
 
  RxBool isSwitchOn = false.obs;

 


RxBool isLoading = false.obs;

  void clickConfirmBtn(isStatus,reserved1,reserved2) async {
    

    try {
      isLoading.value = true;
      var data = {
        "mobile": SessionManager().getMobile().toString(),
        "aParam": AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
              "accountNumber": "",
        "statusType": isStatus, 
        "reserved1": reserved1,
        "reserved2": reserved2
      };

      final response = await wallet_repository.callWalletStatusApi(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request: data,
      );
      if (response.responseCode.toString() == '00') {
       
      } else {
        CustomToast.show(response.responseMessage.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (Get.isRegistered<WalletSettingController>()) {
      Get.delete<WalletSettingController>();
    }
  }

  void handelChangeSwitch(bool val) {
    isSwitchOn.value = val;
    // if (isSwitchOn.value) {
      Get.dialog(
        AlertDialog(
          contentPadding:
              EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
          titlePadding: EdgeInsets.all(15.0),
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: Text(
           isSwitchOn.value? "Deactivate wallet":"Activate wallet",
            style: CustomStyles.black16600,
          ),
          content: Text(
           isSwitchOn.value? "Are you sure you want to deactivate your wallet?": "Are you sure you want to activate your wallet?",
            style: CustomStyles.black14400.copyWith(fontSize: 13.0),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                isSwitchOn.value = false;
                Get.back(); // Close dialog
              },
              child: Text("Cancel",
                  style: CustomStyles.black14400.copyWith(color: Colors.red)),
            ),
            SizedBox(
              width: 5.0,
            ),
            GestureDetector(
              onTap: () {
                sendStatusText("Block Wallet");
              },
              child: Text("Confirm",
                  style:
                      CustomStyles.black14400.copyWith(color: AppColors.dblue)),
            ),
          ],
        ),
      );
    // }
  }

  void clickCardTitle(titleText) {
    if (titleText == 'Close Wallet Account') {
      Get.dialog(
        Dialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/close-wallet-icon.png", // change your image path
                  scale: 2.5,
                  // height: 80,
                  // width: 80,
                ),
                SizedBox(height: 12),

                // Title
                Text(
                  "Are you sure?",
                  style: CustomStyles.black18600.copyWith(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),

                Text(
                  "Do you really want to continue with this action?",
                  style: CustomStyles.grey125
                      .copyWith(fontSize: 13.0, color: AppColors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {
                          Get.back(); // Cancel
                        },
                        text: 'Cancel',
                        bgColor: Colors.red,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {
                        sendStatusText("Close Wallet");
                        },
                        text: 'Confirm',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else if (titleText == 'Reset MPIN') {
      Get.toNamed(RoutesName.resetMpin);
    }

  }
  
  void sendStatusText(String s) {
         Get.back();

    if (s == "Block Wallet") {
      if (isSwitchOn.value) {
      clickConfirmBtn('Temporary','Block','Blocking the wallet Temporary');
        
      } else {
        clickConfirmBtn('Temporary','Unblock','Unblocking the wallet');
     
      }
    } else if (s == "Close Wallet") {
     clickConfirmBtn('Permanent','Close','Closing the wallet permanently');
     
    }
  }
}
