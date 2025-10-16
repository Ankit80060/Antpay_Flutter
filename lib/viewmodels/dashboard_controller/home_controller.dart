import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_url_launcher.dart';
import 'package:antpay_lite/model/billpay/getBillers.dart';
import 'package:antpay_lite/model/offer/game_zone_model.dart';
import 'package:antpay_lite/model/offer/homebanner.dart';
import 'package:antpay_lite/model/wallet/CheckUserRequestModelPayu.dart';
import 'package:antpay_lite/model/wallet/CheckUserResponseModelPayu.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/login_repository/miniAccountRepo/mini_account_repo.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/common_utils.dart';
import 'package:antpay_lite/viewmodels/antpay_socialnews_controller/antpay_socialnews_controller.dart';
import 'package:antpay_lite/views/p2p_lending/investment_dashboard_screen.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widget/custom_toast_msg.dart';
import '../../model/offer/offers_model.dart';
import '../../model/transaction/fetch_card_limit_model.dart';
import '../../model/wallet/point_balance_model.dart';
import '../../model/walletservice/announcement_model.dart';
import '../../repository/login_repository/homeScreenRepo/banner_repository.dart';
import '../../utils/routes/routes_name.dart';

class HomeContoller extends GetxController {
  CommonApiRepo repoClass = CommonApiRepo();
  final AntpaySocialController antpaySocialController =
      Get.put(AntpaySocialController());

  final String urlFacebook = "https://www.facebook.com/antworksmoney";
  final String urlTwitter = "https://twitter.com/AntworksMoney";
  final String urlLinkedln =
      "https://www.linkedin.com/company/antworks-money/mycompany/";

  final MiniAccountRepo repository = MiniAccountRepo();
  var userRetriveData = CheckUserResponseModelPayu().obs;
  List<PaymentCard>? cardListData = <PaymentCard>[].obs;
  List<ServiceResultModel> billIconData = <ServiceResultModel>[].obs;
  PaymentCard? cardDetails;
  List<Subwallet>? walletDetails;

// banner
  BannerApiRepo bannerApiRepo = BannerApiRepo();
  var bannerList = <Bannerlist>[].obs;
  var gamezonebannerList = <GameZoneData>[].obs;

  var activeStep = 0.obs;

  String? kycResponseCode;
  String? kycAccountStatus;
  String? kycName;
  final pageController = PageController();
  RxBool isCardShow = false.obs;
  RxBool isnewuser = false.obs;
  RxBool isLoading = false.obs;
  RxList<Results> offersList = <Results>[].obs;
  RxList<Offer> offersData = <Offer>[].obs;
  RxList<AnnouncementList> announcementList = <AnnouncementList>[].obs;
  final int itemsPerPage = 6;
  @override
  void onInit() {
    super.onInit();
    pageData = paginateData(flatPageData, itemsPerPage);
    getAntPayOffers();
    getTopRecommendationBanner();
    getGameZoneBanner();
    // antpaySocialController.getAntpaySocialnewsdata();
    antpaySocialController.getAntpaySocialNews();

    getCustomerRecord();
    getPointBalance();
    getAnnouncementsData();
  }

  void onStepReached(int index) {
    activeStep.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    activeStep.value = index;
  }

  CarouselSliderController carouselSliderController =
      CarouselSliderController();
  var currentIndex = 0.obs;

  final List<dynamic> items = [
    'Please do not share OTP with anyone',
    'Beware of frauds'
  ];

  final List<Map<String, String>> flatPageData = [
    {"image": 'assets/images/to_wallet_black.png', "title": "Mini Account"},
    {"image": 'assets/images/buddy_logo_icon.png', "title": "Credit Line"},
    {"image": 'assets/images/lend_social_icon.png', "title": "P2P Lending"},
    {"image": 'assets/images/billpay_db.png', "title": "Bill Pay"},
    {"image": 'assets/images/recharges_db.png', "title": "Recharges"},
    {"image": 'assets/images/loan_db.png', "title": "Loan"},
    {
      "image": 'assets/images/creditcard_pay_db.png',
      "title": "Credit Card Pay"
    },
    {"image": 'assets/images/ic_credit_cards.png', "title": "Credit Card"},
    {"image": 'assets/images/motor-insurance.png', "title": "Insurance"},
    {"image": 'assets/images/card-offer-d.png', "title": "Card Offers"},
    {"image": 'assets/images/investment-d.png', "title": "Investment"},
    {"image": 'assets/images/travel.png', "title": "Bookings"},
  ];

  late final List<List<Map<String, String>>> pageData;
  List<List<Map<String, String>>> paginateData(
      List<Map<String, String>> original, int itemsPerPage) {
    List<List<Map<String, String>>> paginated = [];
    for (var i = 0; i < original.length; i += itemsPerPage) {
      paginated.add(
        original.sublist(
          i,
          i + itemsPerPage > original.length
              ? original.length
              : i + itemsPerPage,
        ),
      );
    }
    return paginated;
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void handelClickCard(int index) {
    switch (index) {
      case 0:
        // if (kycResponseCode != null && kycResponseCode.toString() == "00") {
        //   if (kycAccountStatus != null && kycAccountStatus.toString() != "0") {
        //     CustomToast.show("Your Wallet Blocked");
        //     return;
        //   }
        //   Get.toNamed(RoutesName.accountDetails);
        // } else {
        //   Get.toNamed(RoutesName.miniAccPhonePage);
        // }
         Get.toNamed(RoutesName.accountDetails);
        break;
      case 1:
        Get.toNamed(RoutesName.creditLineView);
        break;
      case 2:
        Get.toNamed(RoutesName.p2pLending);

        break;
      case 3:
        Get.toNamed(RoutesName.allBillPay);
        break;
      case 4:
        Get.toNamed(RoutesName.rechargeHomeScreen);
        break;

      case 5:
        Get.toNamed(RoutesName.loanhomescreen);
        break;
      case 6:
        Get.toNamed(RoutesName.creditCardHomeView);
        break;
      case 7:
        Get.toNamed(RoutesName.crediCradApplyHomeView);
        break;
      case 8:
        // Get.toNamed(RoutesName.insuranceHomeScreen);
        break;
      case 9:
        Get.toNamed(RoutesName.cardOfferScreen);
        //  SessionManager().addCustomToken(
        // 'authtoken", "TVRJek5EVT0=');
        break;
      case 10:
        Get.to(() => InvestmentDashboardScreen());
        break;
      case 11:
        CustomUrlLauncher.openUrl("https://anttravel.in/");
        break;
      default:
        CustomToast.show("Comming soon");
    }
  }

  // void topHandelClickCard(int index) {
  //   switch (index) {
  //     case 2:
  //       // Get.toNamed(RoutesName.miniAccPhonePage);
  //       Get.toNamed(RoutesName.addMoney, arguments: {"isaddmoney": true});
  //       break;
  //     default:
  //   }
  // }

  void getAnnouncementsData() async {
    try {
      isLoading.value = true;

      AnnouncementRequestModel data = AnnouncementRequestModel(
          mobile: SessionManager().getMobile(),
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()),
          source: 'Antpay');

      final response = await bannerApiRepo.getAnnouncementsData(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
          data);
      if (response.status.toString() == '1') {
        announcementList.assignAll(response.announcementList);
      } else {
        announcementList.clear();
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      // CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void getAntPayOffers() async {
    try {
      isLoading.value = true;

      final response = await bannerApiRepo.getAntPayOffers();
      if (response.status.toString() == '1') {
        final allOffers = <Offer>[];

        for (var result in response.results) {
          for (var offer in result.offer) {
            final map = Map<String, dynamic>.from(offer.toJson());
            map['offer_banner_img'] = (offer.offerBannerImg?.isNotEmpty == true)
                ? "${result.imgURL}${offer.offerBannerImg}"
                : (offer.offerBannerImg ?? "");

            map['company_icon_img'] = (offer.companyIconImg?.isNotEmpty == true)
                ? "${result.imgURL}${offer.companyIconImg}"
                : (offer.companyIconImg ?? "");

            allOffers.add(Offer.fromJson(map));
          }
        }
        offersData.assignAll(allOffers);
      } else {
        offersList.clear();
      }
    } catch (e) {
      // CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void clickOfferBanner(Offer data) {
    Get.toNamed(RoutesName.bannerViewScreen, arguments: {
      "id": data.id ?? "",
    });
  }

  void getCustomerRecord() async {
    try {
      isLoading.value = true;

      CheckUserRequestModelPayu data = CheckUserRequestModelPayu(
        messageCode: "",
        clientTxnId: "",
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        customerMobile: SessionManager().getMobile().toString(),
      );

      CheckUserResponseModelPayu response = await repository.getCustomerRecord(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        data,
      );


     



      if (response.responseCode.toString() == '00') {

        SessionManager().addKYC(response.kycName.toString());
        isCardShow.value = true;
        isnewuser.value = false;
              kycResponseCode = response.responseCode.toString();
      kycName = response.kycName.toString();
      kycAccountStatus =
          response.cardList!.first.subwalletListDetails!.first.accountStatus;
        userRetriveData(response);
        if (response.cardList != null) {
          cardListData!.assignAll(userRetriveData.value.cardList!);
        }
        if (response.isMpinSet != null) {
          if (response.isMpinSet!)
            SessionManager().addPayUMpinExpiryStatus(response.mpinExpired!);
        }

        if (response.mpinExpired != null)
          SessionManager().addPayUMpinStatus(response.mpinExpired!);

        cardDetails = response.cardList?.first;
        walletDetails = response.cardList?.first.subwalletListDetails;
        String? walletStatus = response.cardList!.first.statusDescription;

        SessionManager().addPayUCustomerDetails(
          customerId: response.customerId!,
          clientId: response.clientId!,
          urn: cardDetails!.urn!.toString(),
          email: response.email!,
          cardNumber: cardDetails!.cardNumber!,
          last4Digits: cardDetails!.lastFourDigit!,
          kycType: response.kycName!,
          uniqueNumberValidity: cardDetails!.uniqueNumberValidity!,
          walletAccountNumber: walletDetails!.first.accountNumber!,
          walletId: walletDetails!.first.subwalletId!,
          accountBalance: CommonUtils.convertAmountToRupees(
              cardDetails!.availableBalance!.toString()),
          walletStatus: walletStatus.toString(),
        );
      } else {
        userRetriveData(null);
        isCardShow.value = false;
        isnewuser.value = true;
      }
    } catch (e) {
      // CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //banners
  Future<void> getTopRecommendationBanner() async {
    try {
      HomebannerModel response = await repoClass.apiClient.homeBanner();

      if (response.status.toString() == "1" && response.banner_list != null) {
        bannerList.assignAll(response.banner_list ?? []);
      } else {
        bannerList.clear();
      }
    } catch (e) {
      bannerList.clear();
    }
  }

  Future<void> getGameZoneBanner() async {
    try {
      GameZoneModel response = await repoClass.apiClient.gameZoneBanner();

      if (response.status.toString() == "1") {
        gamezonebannerList.assignAll(response.data);
      } else {
        gamezonebannerList.clear();
      }
    } catch (e) {
      gamezonebannerList.clear();
    }
  }

  void handelTopFeatureClickCard(int index) {
    switch (index) {
      case 0:
        Get.toNamed(RoutesName.rechargeHomeScreen);
        break;

      case 1:
        SessionManager().addServicetype("Life Insurance");
        Get.toNamed(
          RoutesName.bharatBillPayTemplateView,
          arguments: {"billerCategory": "Life Insurance"},
        );
        break;

      case 2:
        SessionManager().addServicetype("Motor Insurance");
        Get.toNamed(
          RoutesName.bharatBillPayTemplateView,
          arguments: {"billerCategory": "Motor Insurance"},
        );
        break;

      case 3:
        SessionManager().addServicetype("Health Insurance");
        Get.toNamed(
          RoutesName.bharatBillPayTemplateView,
          arguments: {"billerCategory": "Health Insurance"},
        );
        break;

      default:
        CustomToast.show("Coming soon");
        break;
    }
  }

  Future<void> getPointBalance() async {
    try {
      PointBalanceRequestModel data = PointBalanceRequestModel(
          mobile: SessionManager().getMobile(),
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()));

      PointBalanceResponseModel response = await repository.getPointBalance(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
          data);

      if (response.status.toString() == '1') {
        SessionManager().addAntCoinsMoney(response.point ?? "0");
        // coinsBalance.value = response.point ?? "0";
      } else {
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      // CustomToast.show(e.toString());
    } finally {
      // isLoading.value = false;
    }
  }

  void clickManageTransctionLimit() {
    if (cardDetails != null && SessionManager().getPayUCustomerId() != null) {
      fetchCardLimitApi();
    } else {
      CustomToast.show("Create your mini account");
    }
  }

  void fetchCardLimitApi() async {
    isLoading.value = true;
    try {
      isLoading.value = true;

      FetchCardLimitReqModel data = FetchCardLimitReqModel(
        urn: SessionManager().getPayUCustomerUrn(),
        customerId: SessionManager().getPayUCustomerId(),
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        // mobile: SessionManager().getMobile().toString(),
      );

      final response = await repository.getCardLimitApi(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        data,
      );
      if (response.responseCode.toString() == "00") {
        Get.toNamed(RoutesName.transactionLimitPage);
      } else {
        //  Get.toNamed(RoutesName.transactionLimitPage);
        CustomToast.show(response.responseMessage.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void handleTopFeatureClick(int index) {
    switch (index) {
      case 0:
        Get.toNamed(RoutesName.rechargeHomeScreen);
        break;
         case 1:
        SessionManager().addServicetype("Life Insurance");
        Get.toNamed(RoutesName.bharatBillPayTemplateView);
        break;
         case 2:
        SessionManager().addServicetype("Motor Insurance");
        Get.toNamed(RoutesName.bharatBillPayTemplateView);
        break;
         case 3:
        SessionManager().addServicetype("Health Insurance");
        Get.toNamed(RoutesName.bharatBillPayTemplateView);
        break;

      case 4:
         SessionManager().addServicetype("Loan Repayment");
        Get.toNamed(RoutesName.bharatBillPayTemplateView, arguments: {'tabIndex': "0"});
        break;

      case 5:
        SessionManager().addServicetype("PostPaid");
        Get.toNamed(RoutesName.postPaidFragmentScreen);
        break;

      case 6:
        SessionManager().addServicetype("Electricity");
        Get.toNamed(RoutesName.bharatBillPayTemplateView);
        break;

      default:
        CustomToast.show("Comming soon");
    }
  }
}
