import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../api/auth_token.dart';
import '../../../custom_widget/custom_toast_msg.dart';
import '../../../model/offer/offer_details_by_category_model.dart';
import '../../../model/rewardHostory/get_category_pojo.dart';
import '../../../model/wallet/point_balance_model.dart';
import '../../../prefrences/session_manager.dart';
import '../../../repository/login_repository/homeScreenRepo/banner_repository.dart';
import '../../../repository/login_repository/miniAccountRepo/mini_account_repo.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/routes/routes_name.dart';

class CardOfferViewPageController extends GetxController {
  BannerApiRepo bannerApiRepo = BannerApiRepo();
   MiniAccountRepo repository = MiniAccountRepo();

   var selected = Rx<RewardResult?>(null);

  RxList<RewardResult> dropDownData = <RewardResult>[].obs;
  var currentIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxString availableBalance="".obs;
  RxString coinsBalance="0".obs;

  final List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/OffersBanners%2Foffer_img1.png?alt=media&token=ccdd4d10-8da2-4de3-b942-ee4512e98d30",
    "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/OffersBanners%2Foffer_img2.png?alt=media&token=53ba165f-3976-482e-8520-ec75b2b418b0",
    "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/OffersBanners%2Foffer_img3.png?alt=media&token=beef4fba-aa51-4980-b61f-9416cdb528d4",
    "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/OffersBanners%2Foffer_img4.png?alt=media&token=ed796c43-b227-4381-ab2e-32667224b96d",
    "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/OffersBanners%2Foffer_img5.png?alt=media&token=c1542307-6d1a-48d5-ad9e-354483547b21"
  ];
  var selectedDropDownId = RxnString();
  RxMap selectedDropDownItem = {}.obs;
 
  RxList<OfferDetails> offersCategoryList = <OfferDetails>[].obs;

  // final List<dynamic> dropDownData1 = [
  //   {"id": 1, "textName": "POS Contact"},
  //   {"id": 2, "textName": "POS Contactless"},
  //   {"id": 3, "textName": "E-Commerce"},
  //   {"id": 4, "textName": "ATM Withdrawal"},
  // ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // Future.delayed(
    //   Duration(seconds: 2),
    //   () {
    //     isLoading.value = false;
    //   },
    // );
    availableBalance.value=
     SessionManager().getUserAccountBalance()??"0";
      coinsBalance.value = SessionManager().getAntCoinsMoney() ?? "0";
    getDiscountDropdown();
  }

  handelSelectionChange(val) {
    selectedDropDownId.value = val.id.toString();
    getDiscountData(val.id);
    // selectedDropDownItem.value = val;
  }

  final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹ ',
    decimalDigits: 2,
  );

  void handelCardClick() {
 Get.toNamed(RoutesName.coinPage);
  }

  Future<void> getDiscountDropdown() async {
    try {
      isLoading.value = true;

      final response = await repository.getCategoriesDetails(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
      );
      if (response.status.toString() == '1') {
        dropDownData.assignAll(response.result);

        selected.value = dropDownData.firstWhere(
          (e) => e.id == "25",
          orElse: () => dropDownData.first,
        );
         selectedDropDownId.value =  selected.value!.id!;
   
        getDiscountData(
            selected.value!.id!);
      } else {
        dropDownData.clear();
        CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getOS() {
    if (kIsWeb) return "Web";
    if (Platform.isAndroid) return "ANDROID";
    if (Platform.isIOS) return "IOS";
    if (Platform.isWindows) return "Windows";
    if (Platform.isLinux) return "Linux";
    if (Platform.isMacOS) return "macOS";
    return "Unknown";
  }

  void getDiscountData(id) async {
    try {
      isLoading.value = true;
      OfferDetailsByCategoryRequest data =
          OfferDetailsByCategoryRequest(categoryID: id,
          offerType: "Discount",
          source: getOS());

      final response = await bannerApiRepo.getOffersbycategory(data);
      if (response.status.toString() == '1') {
        offersCategoryList.assignAll(response.details);
      } else {
        offersCategoryList.value = [];
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void clickCoupon(BuildContext context, OfferDetails data, int index) {
      Get.toNamed(RoutesName.bannerViewScreen, arguments: {
        "id": data.id ?? "",
      });
  }
}
