
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/views/coinPage/binding/controller/buy_coupons_controller.dart';
import 'package:get/get.dart';




class CoinPageController extends GetxController {

 final buyCouponcontroller = Get.find<BuyCouponPageController>();
  RxString filter = "Select".obs;
  RxInt selectedIndex=0.obs;
  

  List<String> tabsData= ['My Coupons', ' AntPay Coins History', 'Buy Coupons', 'Gift AntPay Coins'].obs;
  



  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (Get.isRegistered<CoinPageController>()) {
      Get.delete<CoinPageController>();
    }
  }

  void handelTabSelection(int index) {
    selectedIndex.value = index;
    if (index!=2) {
      buyCouponcontroller.emptyCouponsData();
      
    }
  }

  void closeClaimCouponPage() {
    selectedIndex.value = 0;
    buyCouponcontroller.emptyCouponsData();
  }

  }
