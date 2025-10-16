import 'package:get/get.dart';

import '../../coinPage/binding/controller/buy_coupons_controller.dart';
import '../controller/card_offer_controler.dart';




class CardOfferPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardOfferViewPageController>(() => CardOfferViewPageController());
    
    Get.lazyPut<BuyCouponPageController>(() => BuyCouponPageController());
    
   
       
       
       
    
  }
} 
