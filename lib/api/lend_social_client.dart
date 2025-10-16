import 'package:antpay_lite/model/full_kyc/full_kyc_model.dart';
import 'package:antpay_lite/model/full_kyc/verify_full_kyc_model.dart';
import 'package:antpay_lite/model/p2p_lending/InvestmentDetailsModel.dart';
import 'package:antpay_lite/model/p2p_lending/InvestmentInvoiceRequest.dart';
import 'package:antpay_lite/model/p2p_lending/InvestmentInvoiceResponse.dart';
import 'package:antpay_lite/model/p2p_lending/lender_invesstment_details_model.dart';
import 'package:antpay_lite/model/p2p_lending/loan_agreement_model.dart';
import 'package:antpay_lite/model/p2p_lending/scheme_investment_model.dart';
import 'package:antpay_lite/model/place_model/city_model.dart';
import 'package:antpay_lite/model/place_model/state_code_request.dart';
import 'package:antpay_lite/model/place_model/state_model.dart';
import 'package:antpay_lite/views/p2p_lending/PaymentProcessingmodel.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../model/billpay/social_after_payment_model.dart';

part 'lend_social_client.g.dart';

@RestApi(baseUrl: "https://www.lendsocial.money/")
abstract class LenSocialApiClient {
  factory LenSocialApiClient(Dio dio, {String baseUrl}) = _LenSocialApiClient;

  @GET("https://antworksp2p.com/credit-line/Commonapi/getState")
  Future<StateModel> getStateList();

  @POST("https://antworksp2p.com/credit-line/commonapi/cityList")
  Future<CityListResponse> getCityList(
      @Body() StateCodeRequest stateCodeRequest);

  @POST("/surgeapi/investapi/lender_investment_details")
  Future<LenderInvestmentDetailsResponseModel> getInvestmentDetails(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() LenderInvestmentDetailsRequestModel data);

  @GET("surgeapi/investapip2p/allSchemeData")
  Future<SchemesInvestmentResponseModel> getInvestmentSchemes(
    @Header("authtoken") String authToken,
    @Header("Authorization") String authorization,
    @Header("oath_token") String oathToken,
  );

  @POST("/kycapi/all_in_one_kyc_status")
  Future<VerifyFullKycResponse> fullKYCStatus(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() VerifyFullKycRequest request);

  @POST("/kycapi/all_in_one_kyc")
  Future<KYCResponse> fullKYC(
      @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
      @Body() FullKycRequest request);

  @POST("surgeapi/investapip2p/investmentDetail")
  Future<InvestmentDetailsResponseModel> getinvestmentDetail(
    @Header("authtoken") String authToken,
    @Header("Authorization") String authorization,
    @Header("oath_token") String oathToken,
    @Body() InvestmentDetailsRequestModel data,
  );

  @GET("/surgeapi/investapip2p/e_sign_lender_agreement")
  Future<LoanAgreementResponse> getLoanAgreementlendsocial(
      @Header("authtoken") String authToken,
      @Header("Authorization") String authorization,
      @Header("oath_token") String oathToken,
     );

      @POST("surgeapi/investapip2p/investmentinvoicedetails")
  Future<InvestmentInvoiceResponse> investmentInvoiceDetails(
      @Header("authtoken") String authToken,
      @Header("Authorization") String authorization,
      @Header("oath_token") String oathToken,
      @Body() InvestmentInvoiceRequest request,
      );


  @POST("surgeapi/investapip2p/InvestmentProcessing")
  Future<PaymentProcessingResponse> sendPaymentProcessingDetails(
      @Header("authtoken") String authToken,
      @Header("Authorization") String authorization,
      @Header("oath_token") String oathToken,
      @Body() PaymentProcessingRequest request,
      );
}
