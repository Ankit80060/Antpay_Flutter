import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/custom_toggle_btn.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/prefrences/utility_prefrences.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/settingController/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  var controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    child: Text(
                      "NOTIFICATIONS",
                      style: CustomStyles.black14500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomToggleBtn(
                    switchValue: controller.isAllNotificationOn,
                    onChanged: (val) =>
                        controller.handleAllNotificationSwitch(val),
                    text: "All Notification",
                    icons: Icons.notifications_active_outlined,
                  ),
                  CustomToggleBtn(
                    switchValue: controller.isOfferNotificationOn,
                    onChanged: (val) =>
                        controller.handleOfferNotificationSwitch(val),
                    text: "Offer Notification",
                    icons: Icons.notification_important_outlined,
                  ),
                  CustomToggleBtn(
                    switchValue: controller.isOtherNotificationOn,
                    onChanged: (val) =>
                        controller.handleOtherNotificationSwitch(val),
                    text: "Other Notification",
                    icons: Icons.notifications_on_outlined,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    child: Text(
                      "LANGUAGES",
                      style: CustomStyles.black14500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => controller.selectLanguage('Hindi'),
              child: Row(
                children: [
                  Image.asset(
                    "assets/sidebar/hindi.png",
                    scale: 2.9,   color: controller.selectedLanguage.value == 'Hindi'
                          ? Colors.red
                          : Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Hindi",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: controller.selectedLanguage.value == 'Hindi'
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () => controller.selectLanguage('English'),
              child: Row(
                children: [
                  Image.asset(
                    "assets/sidebar/english.png",
                    scale: 2.9,color: controller.selectedLanguage.value == 'English'
                          ? Colors.red
                          : Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "English",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: controller.selectedLanguage.value == 'English'
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),

                const  SizedBox(
                    height: 15,
                  ),
                  InkWell(onTap: () {
                       SessionManager().logOutUser();
                  UtilityPreferences().setString('isOnboarded', 'true');

                  Navigator.pushReplacementNamed(context, RoutesName.login);

                  CustomToast.show('User Logged Out Successfully!');
                  },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/sidebar/logout-s.png",
                          scale: 4.5,
                        ),
                        const SizedBox(width: 10),
                        Text("Logout", style: CustomStyles.black14500),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // CustomListtileProfile(
                  //   title: "Logout",
                  //   icons: "assets/sidebar/logout-s.png",
                  //   onTap: () {
                  //     SessionManager().logOutUser();
                  //     UtilityPreferences().setString('isOnboarded', 'true');

                  //     Get.offAllNamed(RoutesName.login);

                  //     CustomToast.show('User Logged Out Successfully!');
                  //   },
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
