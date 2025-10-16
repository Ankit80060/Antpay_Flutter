import 'package:antpay_lite/views/account_transfer/account_transfer_beneficial_screen.dart';
import 'package:antpay_lite/views/account_transfer/account_transfer_screen.dart';
import 'package:antpay_lite/views/account_transfer/add_beneficial_screen.dart';
import 'package:antpay_lite/views/auth/login_screen.dart';
import 'package:antpay_lite/views/auth/otp_verify_screen.dart';
import 'package:antpay_lite/views/auth/user_alert_screen.dart';
import 'package:antpay_lite/views/billpay/allbillpay_screen.dart';
import 'package:antpay_lite/views/billpay/bharatBillPayTemplateView.dart';
import 'package:antpay_lite/views/dashboard/custom_dashboard_screen.dart';
import 'package:antpay_lite/views/loan/Business_loan/BusinessLoanForm.dart';
import 'package:antpay_lite/views/loan/Business_loan/Other_details_screen.dart';
import 'package:antpay_lite/views/loan/Business_loan/business_loan_amount.dart';
import 'package:antpay_lite/views/loan/Personalbinding.dart';
import 'package:antpay_lite/views/loan/Personalloan/occupation_details_screen.dart';
import 'package:antpay_lite/views/loan/Personalloan/personal_loan_screen.dart';
import 'package:antpay_lite/views/loan/carloan/CarLoan_Screen.dart';
import 'package:antpay_lite/views/loan/carloan/carloanform.dart';
import 'package:antpay_lite/views/loan/loan_Verifydetails_screen.dart';
import 'package:antpay_lite/views/loan/loan_home_screen.dart';
import 'package:antpay_lite/views/failure_success_screen.dart';
import 'package:antpay_lite/views/loan/loan_offer_screen.dart';
import 'package:antpay_lite/views/miniAcc/mini_account_form.dart';
import 'package:antpay_lite/views/miniAcc/mini_account_form_failed.dart';
import 'package:antpay_lite/views/miniAcc/mini_account_form_success.dart';
import 'package:antpay_lite/views/notification/notificationscreen.dart';
import 'package:antpay_lite/views/p2p_lending/investment_dashboard_screen.dart';
import 'package:antpay_lite/views/payment_view/recharge_payment_status_screen.dart';
import 'package:antpay_lite/views/recharge/disputeandcomplaints/complaint_status/comlaint_status.dart';
import 'package:antpay_lite/views/recharge/disputeandcomplaints/dispute_screen.dart';
import 'package:antpay_lite/views/recharge/disputeandcomplaints/postcomplaint/post_complaint_screen.dart';
import 'package:antpay_lite/views/recharge/dth_recharge/binding/dth_screenbinding.dart';
import 'package:antpay_lite/views/recharge/dth_recharge/dth_plan_tab_view.dart';
import 'package:antpay_lite/views/recharge/dth_recharge/dth_recharge_screen.dart';
import 'package:antpay_lite/views/recharge/fastag_recharge/fastag_recharge_screen.dart';
import 'package:antpay_lite/views/recharge/mobile_recharge/amount_recharge_screen.dart';
import 'package:antpay_lite/views/recharge/mobile_recharge/mobile_recharge_plan/mobile_recharge_plan_screen.dart';
import 'package:antpay_lite/views/recharge/mobile_recharge/mobile_recharge_screen.dart';
import 'package:antpay_lite/views/recharge/ncmc_metro_recharge/ncmc_metro_recharge.dart';
import 'package:antpay_lite/views/recharge/recharge_home_screen.dart';
import 'package:antpay_lite/views/splash/onboarding_screen.dart';
import 'package:antpay_lite/views/splash/splash_screen.dart';
import 'package:antpay_lite/views/wallet/add_money_screen.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';
import '../../views/billpay/biller_table_binding.dart';
import '../../views/billpay/biller_table_details.dart';
import '../../views/billpay/post_paid_binding.dart';
import '../../views/billpay/post_paid_fragment.dart';
import '../../views/billpay/post_paid_table_details.dart';
import '../../views/cardOffer/binding/card_offerBinding.dart';
import '../../views/cardOffer/card_offer_view.dart';
import '../../views/coinPage/binding/binding/coin_binding.dart';
import '../../views/coinPage/binding/coin_tab_page.dart';
import '../../views/creditCard/creditCardBillPay/credit_card_home_screen.dart';
import '../../views/creditCardApply/credit_card_apply_home_view.dart';
import '../../views/creditCardApply/credit_card_details_view.dart';
import '../../views/creditLine/credit_line_view.dart';
import '../../views/dashboard/banner_details_page.dart';
import '../../views/dashboard/home_screen.dart';
import '../../views/investment/investment_home_page.dart';
import '../../views/miniAcc/account_details_screen.dart';
import '../../views/miniAcc/mini_acc_otp_screen.dart';
import '../../views/miniAcc/mini_acc_phon_screen.dart';
import '../../views/payment_view/recharge_cancel_screen.dart';
import '../../views/payment_view/recharge_payment_fail_screen.dart';
import '../../views/payment_view/recharge_pending_screen.dart';
import '../../views/profile/profile_drawer.dart';
import '../../views/recharge/fastag_recharge/FastagBillCardScreen.dart';
import '../../views/recharge/fastag_recharge/fastag_bill_binding.dart';
import '../../views/recharge/mobile_recharge/binding/amount_rech_binding.dart';
import '../../views/recharge/mobile_recharge/binding/amount_recharge_binding.dart';
import '../../views/recharge/ncmc_metro_recharge/ncmc_binding.dart';
import '../../views/resetMpin/binding/reset_mpin_binding.dart';
import '../../views/resetMpin/reset_mpin_page.dart';
import '../../views/social/social_view.dart';
import '../../views/transaction/binding/transction_filter_binding.dart';
import '../../views/transaction/transaction_filter_history.dart';
import '../../views/transaction/transaction_history.dart';
import '../../views/transcationLimit/binding/transcation_limit_binding.dart';
import '../../views/transcationLimit/transaction_limit_page.dart';
import '../../views/wallet/add_money_binding.dart';
import '../../views/wallet_setting.dart/binding/wallet_setting_binding.dart';
import '../../views/wallet_setting.dart/wallet_setting_view.dart';
import 'routes_name.dart';

class AppPages {
  static final pages = [
    GetPage(name: RoutesName.splash, page: () => SplashScreen()),
    GetPage(name: RoutesName.userAlertScreen, page: () => UserAlertScreen()),
    GetPage(name: RoutesName.onboarding, page: () => OnBoardingScreen()),
    GetPage(name: RoutesName.login, page: () => LoginScreen()),
    GetPage(name: RoutesName.otpVerify, page: () => OTPVerifyScreen()),
    GetPage(name: RoutesName.dashboard, page: () => CustomDashboardScreen()),
    GetPage(
        name: RoutesName.miniAccountForm, page: () => MiniAccountFormView()),

    GetPage(
      name: RoutesName.dashboard,
      page: () =>  MainScaffold(
        selectedIndex: 0,
          isShowAppBar: false,
        body: HomeScreen(),
      ),
    ),
    GetPage(
      name: RoutesName.history,
      page: () =>  MainScaffold(
        selectedIndex: 2,
          isShowAppBar: false,
        body: TransactionHistory(),
      ),
    ),
    GetPage(
      name: RoutesName.social,
      page: () =>  MainScaffold(
        selectedIndex: 3,
         isShowAppBar: false,
        body: SocialView(),
      ),
    ),
    GetPage(
      name: RoutesName.profile,
      page: () =>  MainScaffold(
        selectedIndex: 1,
         isShowAppBar: false,
        body: ProfileView(),
      ),
    ),
    GetPage(
        name: RoutesName.miniAccountFormFailed,
        page: () => MiniAccountFormFailed()),
    GetPage(
        name: RoutesName.miniAccountFormSuccess,
        page: () => MiniAccountFormSuccess()),

            GetPage(
        name: RoutesName.failureSuccessScreen,
        page: () => FailureSuccessScreen(),
      
        transition: Transition.cupertino),
    GetPage(
      name: RoutesName.addMoney,
      binding: AddMoneyViewBinding(),
      page: () {
        final args = Get.arguments ?? {};
        return AddMoneyView(
          isRechargeScreen: args["isaddmoney"] ?? false,
        );
      },
       transition: Transition.cupertino,

    ),
    GetPage(
        name: RoutesName.accountDetails,
        page: () => AccountDetailsPages(),
        transition: Transition.cupertino
        // binding: HomeBinding(),
        ),
    GetPage(
        name: RoutesName.transctionHistory,
        page: () => TransctionFilterPage(),
        transition: Transition.cupertino,
        binding: TransctionFilterBinding()),
    GetPage(
        name: RoutesName.walletSetting,
        page: () => WalletSettingPage(),
        binding: WalletSettingBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.coinPage,
        page: () => CoinTabPage(),
        binding: CoinPageBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.resetMpin,
        page: () => ResetMpinScreen(),
        binding: ResetMpinBinding(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.transactionLimitPage,
        page: () => TransactionLimitPage(),
        binding: TransctionLimitBinding(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.miniAccPhonePage,
        page: () => MiniAccPhonePage(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.miniAccOtpPage,
        page: () => MiniAccOtpPage(service: "",),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.bannerViewScreen,
        page: () => BannerViewScreen(),
        transition: Transition.cupertino),

    //billpay
    GetPage(
        name: RoutesName.bharatBillPayTemplateView,
        page: () => BharatBillPayTemplateView(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.allBillPay,
        page: () => AllBillPay(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.rechargeHomeScreen,
        page: () => RechargeHomeScreen(),
        binding: MobileRechargeBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.mobileRechargeView,
        page: () => MobileRechargeScreen(),
        binding: MobileRechargeBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.amountrechargescreen,
        binding: AmountRechargeBinding(),
        page: () => AmountRechargeScreen()),
    GetPage(
        name: RoutesName.mobileRechargePlanScreen,
        page: () => MobileRechargePlanView(),
        transition: Transition.cupertino),

    GetPage(
        binding: CardOfferPageBinding(),
        name: RoutesName.cardOfferScreen,
        page: () => CardOfferViewPage(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.postPaidFragmentScreen,
        page: () => PostPaidFragment(),
        transition: Transition.cupertino),
   GetPage(name: RoutesName.accounttransferScreen, page: () => AccountTransferScreen()),
    GetPage(name: RoutesName.addbeneficiaryscreen, page: () => AddBeneficiaryScreen()),
    GetPage(name: RoutesName.fetchbeneficiaryscreen, page: () => AccountTransferBeneficailScreen()),
        

    GetPage(
        name: RoutesName.billerTableDetailsPage,
        binding: BillerTableBinding(),
        page: () => BillerTableDetailsPage(),
        transition: Transition.cupertino),

    GetPage(
      name: RoutesName.postPaidTableDetailsPage,
      binding: PostPaidTableBinding(),
      page: () => PostPaidTableDetailsPage(),
      transition: Transition.cupertino,
    ),

    GetPage(
      name: RoutesName.fastagBillCardScreen,
      binding: FastagBillCardBinding(),
      page: () => FastagBillCardScreen(),
      transition: Transition.cupertino,
    ),

    GetPage(
        name: RoutesName.dthRechargeView,
        page: () => DthRechargeView(),
        binding: DthRechargeBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.dthPlanTabView,
        page: () => DthPlanTabView(),
        binding: DthRechargeBinding(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.fastagRechargeView,
        page: () => FastagRechargeScreen(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.ncmcmetrorechargescreen,
        page: () => NCMCMetroRechargeScreen(),
        binding: NcmcTableBinding(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.disputescreen,
        page: () => DisputeScreen(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.postcomplaint,
        page: () => PostComplaint(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.complaintstatusscreen,
        page: () => ComplaintStatusScreen(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.notificationscreen,
        page: () => NotificationScreen(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.rechargeFail,
        page: () => RechargeFailView(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.rechargeSuccess,
        page: () => RechargePaymentStatusScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.pendingOrderScreen,
        page: () => PendingOrderScreen(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.rechargeCancelScreen,
        page: () => RechargeCancelScreen(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.creditCardHomeView,
        page: () => CreditCardHomeView(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.creditLineView,
        page: () => CreditLineView(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.crediCradApplyHomeView,
        page: () => CrediCradApplyHomeView(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.crediCradDetailsView,
        page: () => CrediCradDetailsView(),
        transition: Transition.cupertino),

    GetPage(
        name: RoutesName.loanhomescreen,
        page: () => LoanHomeScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.personalloanform,
        page: () => PersonalLoanForm(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.occupationdetails,
        page: () => OccupationDetailsScreen(),
        transition: Transition.cupertino,
        binding: PersonalloanBinding()),
    GetPage(
      name: RoutesName.otherdetailsscreen,
      page: () => OtherDetailsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutesName.carloanform,
      page: () => CarLoanForm(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutesName.carloanscreen,
      page: () => CarLoanScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
        name: RoutesName.p2pLending,
        page: () => InvestmentDashboardScreen(),
        transition: Transition.cupertino),

        

         GetPage(
        name: RoutesName.investmentHomeView,
        page: () => InvestmentHomeView(),
        transition: Transition.cupertino),

        
        

        
        
    GetPage(
      name: RoutesName.businessloanamount,
      page: () => BusinessLoanAmount(),
      transition: Transition.cupertino,
    ),
    GetPage(
        name: RoutesName.businessloanform,
        page: () => BusinessLoanForm(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.loanofferscreen,
        page: () => LoanOfferScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.loanverifydetailsscreen,
        page: () => LoanVerifyDetailsScreen(),
        transition: Transition.cupertino),
  ];
}
