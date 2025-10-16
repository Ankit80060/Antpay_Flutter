

import 'package:get/get.dart';

import '../../custom_widget/custom_toast_msg.dart';
import '../../model/offer/offer_details_model.dart';
import '../../repository/login_repository/homeScreenRepo/banner_repository.dart';

class BannerViewContoller extends GetxController {
  BannerApiRepo bannerApiRepo = BannerApiRepo();

  RxBool isLoading = false.obs;
  String offerID = "";
    var offersDetailsList = OfferDetails().obs;

  RxString couponIds ="".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    offerID = Get.arguments['id'] ?? "";
    getOfferdetails();
  }
  

  void getOfferdetails() async {
    try {
      isLoading.value = true;
       OfferDetailsRequest id= OfferDetailsRequest(offerID: offerID);
     

      final response = await bannerApiRepo.getOfferdetails(id);
      if (response.status.toString() == '1') {
        couponIds.value=response.details?.couponId??"";
        offersDetailsList(response.details?.offerDetails!);
        
      } else {
        offersDetailsList(null);
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }


}