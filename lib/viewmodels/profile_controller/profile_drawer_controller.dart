import 'dart:convert';
import 'dart:io';

import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/model/Profile/profile_image_model.dart';
import 'package:antpay_lite/model/Profile/profile_upload_image_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../custom_widget/custom_toast_msg.dart';
import '../../custom_widget/customstyles.dart';
import '../../prefrences/utility_prefrences.dart';
import '../../utils/routes/routes_name.dart';

class ProfileDrawerController extends GetxController {
  var isLoading = false.obs;
  var imagePic = ''.obs;
  var pickedImagePath = ''.obs;
  var base64Image = ''.obs;
  CommonApiRepo repo = CommonApiRepo();
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImagePath.value = image.path;
      final bytes = await File(image.path).readAsBytes();
      base64Image.value = base64Encode(bytes);
      ProfilePicUploadRequest request = ProfilePicUploadRequest(
        mobile: SessionManager().getMobile().toString(),
        profilePic: base64Image.value,
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      );
      final response = await repo.apiClient.getUploadProfilePic(
        AuthToken.getAuthToken(),
        SessionManager().getToken().toString(),
        request,
      );
      if (response.status == '1') {
        imagePic.value = response.pic;

        SessionManager().addProfilePic(imagePic.value);
      } else {
        print('Error: ${response.msg}');
      }
    } else {
      print("No image selected");
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedImagePath.value = image.path;
      final bytes = await File(image.path).readAsBytes();
      base64Image.value = base64Encode(bytes);

      ProfilePicUploadRequest request = ProfilePicUploadRequest(
        mobile: SessionManager().getMobile().toString(),
        profilePic: base64Image.value,
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      );

      final response = await repo.apiClient.getUploadProfilePic(
        AuthToken.getAuthToken(),
        SessionManager().getToken().toString(),
        request,
      );

      if (response.status == '1') {
        imagePic.value = response.pic;
        SessionManager().addProfilePic(imagePic.value);
      } else {
        print('Error: ${response.msg}');
      }
    } else {
      print("No image captured");
    }
  }

  Future<void> getProfilePic() async {
    isLoading.value = true;

    try {
      ProfilePicRequest request = ProfilePicRequest(
        mobile: SessionManager().getMobile().toString(),
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      );

      final response = await repo.apiClient.getProfilePic(
        AuthToken.getAuthToken(),
        SessionManager().getToken().toString(),
        request,
      );

      if (response.status == '1') {
        imagePic.value = response.pic ?? '';
        SessionManager().addProfilePic(imagePic.value);
        print('Profile Pic URL: ${imagePic.value}');
      } else {
        print('Error: ${response.msg}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfilePic();
  }

  void clickLogoutFromApp() {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
        titlePadding: EdgeInsets.all(15.0),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        title: Text(
          "Logout",
          style: CustomStyles.black16600,
        ),
        content: Text(
          "Are you sure you want to logout?",
          style: CustomStyles.black14400.copyWith(fontSize: 13.0),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text("Cancel",
                style: CustomStyles.black14400.copyWith(color: Colors.red)),
          ),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () {
              SessionManager().logOutUser();
              UtilityPreferences().setString('isOnboarded', 'true');

              Get.offAllNamed(RoutesName.login);

              CustomToast.show('User Logged Out Successfully!');
            },
            child: Text("Confirm",
                style:
                    CustomStyles.black14400.copyWith(color: AppColors.dblue)),
          ),
        ],
      ),
    );
  }
}
