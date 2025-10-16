import 'package:antpay_lite/model/AccountTransfer/CustomerAddBeneficiaryResponse.dart';
import 'package:antpay_lite/model/AccountTransfer/CustomerFundTransferRequest.dart';
import 'package:antpay_lite/model/AccountTransfer/CustomerFundTransferResponse.dart';
import 'package:antpay_lite/model/AccountTransfer/VerifyW2ACredentialsRequest.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_account_beneficiary_request.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_account_beneficiary_response.dart';
import 'package:antpay_lite/model/Profile/profile_image_model.dart';
import 'package:antpay_lite/model/Profile/profile_update_model.dart';
import 'package:antpay_lite/model/Profile/profile_upload_image_model.dart';
import 'package:antpay_lite/model/WalletTransfer/add_wallet_beneficiary_reponse.dart';
import 'package:antpay_lite/model/WalletTransfer/add_wallet_beneficiary_request.dart';
import 'package:antpay_lite/model/antpay_social/antpay_social_model.dart';
import 'package:antpay_lite/model/antpay_social/blog_model.dart';
import 'package:antpay_lite/model/antpay_social/social_video_model.dart';
import 'package:antpay_lite/model/auth_model/user_name_model.dart';
import 'package:antpay_lite/model/billpay/BBPSGetBillerBean.dart';
import 'package:antpay_lite/model/billpay/BillersLifeInsurance.dart';
import 'package:antpay_lite/model/billpay/FastageModelbillavenue.dart';
import 'package:antpay_lite/model/billpay/loan_repayment_biller_model.dart';
import 'package:antpay_lite/model/device_model/check_user_auth_model.dart';

import 'package:antpay_lite/model/loan_model/AllLoanModel.dart';
import 'package:antpay_lite/model/loan_model/BrandModel.dart';
import 'package:antpay_lite/model/loan_model/LoadDisbursementRequest.dart';
import 'package:antpay_lite/model/loan_model/RTO.dart';
import 'package:antpay_lite/model/loan_model/VechileModel.dart';
import 'package:antpay_lite/model/loan_model/loan_request_model.dart';
import 'package:antpay_lite/model/loan_model/state_model.dart';
import 'package:antpay_lite/model/notification/notification_model.dart';

import 'package:antpay_lite/model/feedback/feedback_request_get.dart';
import 'package:antpay_lite/model/feedback/feedback_request_save.dart';
import 'package:antpay_lite/model/feedback/feedback_response_get.dart';
import 'package:antpay_lite/model/feedback/feedback_response_save.dart';

import 'package:antpay_lite/model/offer/game_zone_model.dart';
import 'package:antpay_lite/model/offer/homebanner.dart';
import 'package:antpay_lite/model/otp_model/comman_otpVerify_model.dart';
import 'package:antpay_lite/model/otp_model/comman_send_otp_bean.dart';
import 'package:antpay_lite/model/otp_model/otp_model.dart';
import 'package:antpay_lite/model/p2p_lending/social_payment_generate_order_model.dart';
import 'package:antpay_lite/model/payment/PayUHashResponse.dart';
import 'package:antpay_lite/model/payment/PayUStringHash.dart';
import 'package:antpay_lite/model/payment/customer_load_balance.dart';
import 'package:antpay_lite/model/payment/generatePayUOrderModel.dart';
import 'package:antpay_lite/model/ppi_kyc_reg_user_model/ppi_kyc_reg_user_request_model.dart';
import 'package:antpay_lite/model/ppi_kyc_reg_user_model/ppi_kyc_reg_user_response_model.dart';
import 'package:antpay_lite/model/recharge_model/circle_list_model.dart';
import 'package:antpay_lite/model/recharge_model/complain_status_bean.dart';
import 'package:antpay_lite/model/recharge_model/fetchplan_list_dth_model.dart';
import 'package:antpay_lite/model/recharge_model/fetchplan_list_model.dart';
import 'package:antpay_lite/model/recharge_model/mobile_number_check_model.dart';
import 'package:antpay_lite/model/recharge_model/operator_list_model.dart';

import 'package:antpay_lite/model/recharge_model/post_complain.dart';

import 'package:antpay_lite/model/reminder_Request/reminder_request.dart';
import 'package:antpay_lite/model/reminder_Request/reminder_response.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/AccountTransfer/customer_fetch_beneficiary.dart';
import '../model/Coupons/change_wallet_status_model.dart';
import '../model/Coupons/get_payment_pin_model.dart';
import '../model/Coupons/send_otp_gift_point.dart';
import '../model/Mpin/SetMpinModel.dart';
import '../model/antPayCard/transaction_history_response_model.dart';
import '../model/billpay/FetchBillBean.dart';
import '../model/billpay/GetCategoriesBean.dart';
import '../model/billpay/bill_pay_request.dart';
import '../model/billpay/getBiller_inputfields_model.dart';
import '../model/billpay/getBillers.dart';
import '../model/billpay/getOperator.dart';
import '../model/creditCard/credit_card_model.dart';
import '../model/investment/investment_response.dart';
import '../model/offer/offer_details_by_category_model.dart';
import '../model/offer/offer_details_model.dart';
import '../model/offer/offers_model.dart';
import '../model/payment/limit_update_request_model.dart';
import '../model/recharge_model/convenience_model.dart';
import '../model/recharge_model/recharge_payu_model.dart';
import '../model/recharge_model/recharge_status_check.dart';
import '../model/rewardHostory/coupon_resmodel.dart';
import '../model/rewardHostory/get_category_pojo.dart';
import '../model/rewardHostory/point_history_bean.dart';
import '../model/transaction/fetch_card_limit_model.dart';
import '../model/transaction/transaction_history_model.dart';
import '../model/transaction/transaction_profile_model.dart';
import '../model/transaction/transaction_response_model.dart';
import '../model/wallet/CheckUserRequestModelPayu.dart';
import '../model/wallet/CheckUserResponseModelPayu.dart';
import '../model/wallet/FetchCardInfoRequestModel.dart';
import '../model/wallet/FetchCardInfoResponseModel.dart';
import '../model/wallet/GetBankDetailsRequestModel.dart';
import '../model/wallet/GetBankDetailsResponseModel.dart';
import '../model/wallet/WalletBalanceRequestModel.dart';
import '../model/wallet/WalletBalanceResponseModel.dart';
import '../model/wallet/point_balance_model.dart';

import '../model/walletservice/announcement_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://antworksmoney.com/apiserver/")
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

//login

  @POST("antapp/getname")
  Future<UsernameResponse> getUsername(@Body() UsernameRequest request);

// Verify OTP
  @POST("antapp/verifyOTP")
  Future<OTPBean> otp(@Body() OTPRequestModel dataPost);

//token verification
  @POST("antapp/token_verification")
  Future<CheckUserAuthModel> checkUserAuthentication(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oathToken,
      @Body() Map<String, dynamic> mobile);

// commanSendOtpAppi
  @POST("commonapis/sendOtp")
  Future<CommonSendOtpResponseModel> commanUserSendOtp(
    @Header("oath_token") String oathToken,
    @Header("Authorization") String authorization,
    @Body() CommonSendOtpRequestModel CommonSendOtpRequestModel,
  );

  @POST("commonapis/verifyOtp")
  Future<CommanUserOtpVerifyResponseModel> commanUserOtpVerify(
      @Header("Authorization") String oAuthTokenValue,
      @Header("oath_token") String authValue,
      @Body() CommanUserOtpVerifyRequestModel dataProfile);
  @POST("antapp/updateProfile")
  @POST("antapp/updateProfile")
  Future<ProfileUpdateResponseModel> profileUpdate(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() ProfileUpdateRequestModel dataProfile);

 
  @POST("ppi/getcard") // Get Card Details
  Future<FetchCardInfoResponseModel> fetchCardInfo(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() FetchCardInfoRequestModel request);

  @POST("ppi/getAccountdetails")
  Future<GetBankDetailsResponseModel> fetchAccountInfo(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() GetBankDetailsRequestModel request);

  //  @POST("antapp/updateProfile")
  // Future<ProfileUpdateResponseModel> profileUpdate(
  //     @Header("oath_token") String authValue,
  //     @Header("Authorization") String oAuthTokenValue,
  //     @Body() ProfileUpdateRequestModel dataProfile);

  @POST("pointapi/pointbalance") // Get coin balance
  Future<PointBalanceResponseModel> getPointBalance(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() PointBalanceRequestModel data);

  //payuppireguser
  @POST("PayU_ppi/reguser")
  Future<PpiRegisterUserResponse> ppiMIniKycRegUser(
      @Header("Authorization") String oAuthTokenValue,
      @Header("oath_token") String authValue,
      @Body() PpiRegisterUserRequest ppiregisterUserRequest);



  @POST("antapp/generateOrder")
  Future<GeneratePayUOrderModelBean> generatePayUorder(
      @Body() GeneratePayUOrderModel data,
      @Header("Authorization") String oAuthTokenValue,
      @Header("oath_token") String authValue);

  @POST("antapp/generateHash_payu")
  Future<PayUHashResponse> getPayuHash(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oathToken,
      @Body() PayUStringHash dataPost);

  @POST("PayU_ppi/loadAccount")
  Future<dynamic> customerloadaccount(



      @Header("Authorization") String authValue,
      @Header("oath_token") String oAuthTokenValue,
      @Body() CustomerLoadbalanceRequest ppicustomloadaccountRequest);

  @POST("offers/offersapi/offer_list_assigned_to_user")
  Future<CouponResModel> getUserCoupon(@Body() Map<String, dynamic> data);

  @POST("pointapi/point_history") // Coin History
  Future<PointHistoryBean> pointHistory(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() pointHistoryRequestPOJO data);

  @GET("offers/offersapi/getCategories")
  Future<GetCategoryPOJO> fetchOfferCategory(
    @Header("oath_token") oathToken,
    @Header("Authorization") String authValue,
  );

  @POST("offers/offersapi/getCouponbycategory")
  Future<GetOfferByCategoryResponse> fetchCouponOfferByCategory(
      @Header("oath_token") oathToken,
      @Header("Authorization") String authValue,
      @Body() Map<String, dynamic> data);

  @POST("antapp/transactiondetails")
  Future<TransactionResponseModel> transactiondetails(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() TransactionRequestModel dataProfile);

  @POST("antapp/appTransaction")
  Future<TransactionHistoryResponseModel> transaction(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() TransactionHistoryRequestModel dataProfile);

  @POST("antapp/get_pin")
  Future<GetPaymentPinResponse> getPaymentPin(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oathToken,
      @Body() Map<String, dynamic> dataPost);

  @POST("pointapi/send_otp_giftPoint")
  Future<GetGiftOtpResponse> getRewardcoinsOtp(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() Map<String, dynamic> data);

  @POST("pointapi/verify_otp_giftPoint")
  Future<GetVerifyGiftOtpResponse> getVerifyRewardOtp(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() Map<String, dynamic> data);

  // Min Acc Module API

  @POST("PayU_ppi/changeWalletStatus")
  Future<ChangeWalletStatusResponse> changeWalletStatus(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() Map<String, dynamic> data);

  @POST("PayU_ppi/w2a/sendOtp")
  Future<CustomerFetchBeneficiaryResponse> send2FAOtp(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() Map<String, dynamic> request);

  @POST("PayU_ppi/w2a/verifyMPinDeviceId")
  Future<CustomerFetchBeneficiaryResponse> verifyW2ACredential(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() VerifyW2ACredentialsRequest request);

  @POST("PayU_ppi/w2a/setResetMPin")
  Future<SetMPinResponse> setMpin(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() SetMPinRequest request);

  //       @POST("PayU_ppi/retrieveCustRecord")
  // Future<CustomerRecordResponseModel> retrieveCustomerRecord(
  //     @Header("oath_token") String authValue,
  //     @Header("Authorization") String oAuthTokenValue,
  //     @Body() CustomerFetchBeneficiaryResponse request);

  @POST("PayU_ppi/retrieveCustRecord")
  Future<CheckUserResponseModelPayu> checkUser_Payu(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() CheckUserRequestModelPayu CheckUserRequestModelPayu);

  // HOME SCREEN API Banner Offer

  @GET("offers/offersapi/getHomeoffers_by_Categories_V1")
  Future<OfferResponse> getOffers();

  @POST("antapp/get_announcement")
  Future<AnnouncementResponseModel> getAnnouncements(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() AnnouncementRequestModel requestData);

  @POST("offers/offersapi/getOfferdetails")
  Future<OfferDetailsResponse> fetchOfferDetails(
      @Body() OfferDetailsRequest data);

  //top recommendation banner
  @GET("offers/offersapi/homebanner")
  Future<HomebannerModel> homeBanner();

  // gamezone banner
  @GET("gamezop/banners")
  Future<GameZoneModel> gameZoneBanner();

  //antpay social
  @GET("social/getnews")
  Future<AntpaySocialNewsModel> getAntpaySocialNews();

  //antpay social video
  @GET("social/video_list")
  Future<SocialVideoModel> getAntpaySocialVideos();

//antpay social blogs
  @POST("https://antworksmoney.com/financial_buddy/blogs")
  Future<String> getBlogsData(@Body() BlogRequest body);

  // Bill Payment API
  @GET("/specified/specificstepbbps/getCategories")
  Future<SchemesInvestmentResonseModel> getCategory(
    @Header("Authorization") String authValue,
    @Header("oath_token") String oathToken,
  );

  // billavenue and Recharge api

  @POST("/specified/specificstepbbps/getBillers")
  Future<GetBillersServiceRes> getServiceName(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oath_token,
      @Body() BillersServiceReqModel dataPost);

  @POST("/specified/specificstepbbps/getOperatordetails")
  Future<OperatorResponse> getOperatordetails(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oath_token,
      @Body() getOperatorRequestModel dataPost);

  @POST("/specified/specificstepbbps/billFetch")
  Future<FetchBillBean> getBillerServiceDetails(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oath_token,
      @Body() FetchBillRequestModel dataPost);

  // @POST("/specified/specificstepbbps/getBillerinputfields")
  // Future<HealthinputfieldsResponseModel> getBillerServiceInputfields(
  //     @Header("Authorization") String authValue,
  //     @Header("oath_token") String oath_token,
  //     @Body() getBiller_inputfields_model dataPost);

  @POST('billavenue/getBillers')
  Future<HealthInsuranceResponseModel> getBillerName(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() HealthInsuranceRequestModel body);

  @POST("billavenue/getBillerinputfields")
  Future<BillersLifeInsurance> getBillerinputfields(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() BillersRequestModel request);

  @POST("billavenue/billfetch")
  Future<LoanRepaymentBillerModel> getBillDetails(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oath_token,
      @Body() FetchBillerModel dataPost);

  // call after success payment

  @POST("billavenue/billpay")
  Future<BillPayResponse> getBillPay(@Header("Authorization") String authValue,
      @Header("oath_token") String oathToken, @Body() BillPayRequest dataPost);

  @POST("specified/recharge/payUResponse")
  Future<RechargePayUPaymentRes> generateRechargePayUResponse(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oath_token,
      @Body() RechargePayUPaymentReq dataPost);

  @POST("specified/recharge/checkRechargestatus")
  Future<RechargeStatusRes> checkRechargestatus(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oath_token,
      @Body() RechargeStatusReq request);

  // Recharge Api

  @POST("/payU_ppi/transactionStatement")
  Future<CustomerTransactionHistoryResponseModel> cardHistory(
    @Header("oath_token") String authValue,
    @Header("Authorization") String oAuthTokenValue,
    @Body() CustomerTransactionHistoryRequestModel request,
  );
  @POST("specified/recharge/mnpApi")
  Future<MobileNumberCheckResponseModel> checkMobile(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() MobileNumberCheckRequestModel data);

  @GET("specified/recharge/getListofoperatormobile")
  Future<OperatorList> getOperators(
      @Header("oath_token") String oAuthTokenValue,
      @Header("Authorization") String authValue);

  @GET("specified/recharge/getListofcircle")
  Future<CircleList> getCircles(@Header("oath_token") String oAuthTokenValue,
      @Header("Authorization") String authValue);

  @POST("specified/recharge/fetchPlan")
  Future<fetchplan_list_model> fetchPlan(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oath_token,
      @Body() fetchPlanRequestModel dataPost);

  //complaint

  @POST("specified/recharge/complainStatus")
  Future<ComplainStatusBean> getComplainStatus(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oath_token,
      @Body() Map<String, dynamic> dataPost);

  @POST("specified/recharge/complain")
  Future<PostComplain> getComplain(
    @Header("Authorization") String authValue,
    @Header("oath_token") String oathToken,
    @Body() PostComplain dataPost,
  );

  // Transaction Limit

  @POST("/payU_ppi/fetchCardLimit")
  Future<FetchCardLimitResModel> cardCardLimit(
    @Header("oath_token") String authValue,
    @Header("Authorization") String oAuthTokenValue,
    @Body() FetchCardLimitReqModel request,
  );

  @POST("/payU_ppi/updateCardLimit")
  Future<LimitUpdateResponse> updateCardLimit(
    @Header("oath_token") String authValue,
    @Header("Authorization") String oAuthTokenValue,
    @Body() LimitUpdateRequest request,
  );

  @POST("/payU_ppi/transactionProfile")
  Future<TransactionStatusResponseModel> transactionProfile(
    @Header("oath_token") String authValue,
    @Header("Authorization") String oAuthTokenValue,
    @Body() TransactionProfileRequestModel request,
  );

  @POST("offers/offersapi/getOffersbycategory")
  Future<OfferDetailsByCategoryResponse> fetchOfferByCategory(
      @Body() OfferDetailsByCategoryRequest data);

  // DTH API

  @GET("specified/recharge/getListofoperatordth")
  Future<OperatorList> getOperatorsdth(
      @Header("oath_token") String oAuthTokenValue,
      @Header("Authorization") String authValue);

  @POST("specified/recharge/fetchPlan")
  Future<fetchplan_list_dth_model> fetchPlandth(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oath_token,
      @Body() fetchPlanRequestModeldth dataPost);

  //notification
  @POST("antapp/get_notification")
  Future<FetchNotificationResponseModel> fetchNotifications(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() FetchNotificationRequestModel data);

  // get_fee_rate

  @POST("antapp/get_fee_rate")
  Future<ConvenienceFeeResData> getFeeRates(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() ConvenienceReqData data);

  @POST("billavenue/billfetch")
  Future<FetchBillBeanFastage> getFetchbill(
      @Header("Authorization") String authValue,
      @Header("oath_token") String oath_token,
      @Body() FastageModelbillavenueModel dataPost);

  @GET("antapp/allCreditCardOffers")
  Future<CreditCardResponse> fetchCreditCard(
    @Header("Authorization") String authValue,
    @Header("oath_token") String oath_token,
  );

  @GET("antapp/allCreditCardOffers")
  Future<CreditCardResponse> fetchCreditCardById(
    @Header("Authorization") String authValue,
    @Header("oath_token") String oathToken,
    @Query("id") String id,
  );
  @POST("loans/getLoan")
  Future<dynamic> getLoanStatus1(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() LoanRequestModel loan);

// car loan
  @GET('masterdata/hdfc/motorModal')
  Future<BrandModel> getBrands();

  @GET("masterdata/hdfc/hdfcState")
  Future<StateResponse> getStatesForCar();

  @POST("masterdata/hdfc/motorModelBrand")
  @MultiPart()
  Future<VehcileData> getMotorModelBrand(
    @Part(name: "manufacturer") String manufacturer,
  );

  @POST("masterdata/hdfc/motorRto")
  @MultiPart()
  Future<RtoResponse> getRTOFromStates(
      @Part(name: "num_state_cd") String state);

  @POST("PayU_ppi/w2a/addBeneficiary")
  Future<CustomerAccountBeneficiaryResponse> addCustomerAccountBeneficiary(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() CustomerAccountBeneficiaryRequest dataPost);

  @POST("PayU_ppi/fetchBeneficiary")
  Future<CustomerFetchBeneficiaryResponse> CustomerFetchBeneficiary(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() CustomerFetchBeneficiaryRequest CustomerFetchBeneficiaryRequest);

  @POST("PayU_ppi/w2a/walletToAccountTransfer")
  Future<CustomerAccountBeneficiaryResponse> processW2ATransfer(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() CustomerAccountBeneficiaryRequest request);

  @POST("PayU_ppi/addBeneficiary")
  Future<WalletAddBenefiaryResponseModel> addwalletBenficiary(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() WalletAddBenficiaryRequestModel dataPost);

  @POST("PayU_ppi/fundTransfer")
  Future<CustomerFundTransferResponse> CustomerFundTransfer(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() CustomerFundTransferRequest dataPost);

  @POST("antapp/update_callback_reminder")
  Future<ReminderResponse> getReminderCallback(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() ReminderRequest dataPost);

  @POST("https://antworksmoney.com/financial_buddy/save_user_feedback")
  Future<FeedbackResponseSave> saveFeedback(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() Map<String, dynamic> dataPost);

  @POST("https://antworksmoney.com/financial_buddy/get_user_feedback")
  Future<FeedbackResponseGet> getFeedback(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() FeedbackRequestGet dataPost);

  @POST("antapp/get_profile_pic")
  Future<ProfilePicResponse> getProfilePic(
      @Header("Authorization") String oAuthTokenValue,
      @Header("oath_token") String authValue,
      @Body() ProfilePicRequest model);
      
  @POST("antapp/profile_pic")
  Future<ProfilePicUploadResponse> getUploadProfilePic(
      @Header("Authorization") String oAuthTokenValue,
      @Header("oath_token") String authValue,
      @Body() ProfilePicUploadRequest model);

   //  InvestemnetGenerateOrder
     @POST("antapp/generateOrder")
  Future<SocialPaymentGenerateOrderResponseModel> socialGenerateOrder(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() SocialPaymentGenerateOrderRequestModel data);

      

  @POST('loans/getCarLoan')
  Future<dynamic> getCarLoanStatus(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() LoanRequestModel loan);

  @POST("loans/getMyLoans")
  Future<AllLoansModel> getMyLoans(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() LoadDisbursementRequest request);
      
}
