import 'package:antpay_lite/views/coinPage/binding/controller/coin_page_controller.dart';
import 'package:antpay_lite/views/coinPage/binding/controller/gift_coins_controller.dart';
import 'package:get/get.dart';

import '../controller/buy_coupons_controller.dart';
import '../controller/coin_history_controller.dart';
import '../controller/coupons_claim_controller.dart';
import '../controller/my_coupons_controller.dart';


class CoinPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoinPageController>(() => CoinPageController());
    Get.lazyPut<GiftCoinsPageController>(() => GiftCoinsPageController());
       Get.lazyPut<BuyCouponPageController>(() => BuyCouponPageController());
       
      //  Get.lazyPut<MyCouponPageController>(() => MyCouponPageController());
      //  Get.lazyPut<CoinHistoryPageController>(() => CoinHistoryPageController());

       
       
       
    
  }
} 
