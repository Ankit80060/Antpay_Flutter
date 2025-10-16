import 'package:antpay_lite/model/loan_model/credit_score_request_model.dart';
import 'package:antpay_lite/model/loan_model/credit_score_response_model.dart';
import 'package:antpay_lite/model/loan_model/loan_request_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/investment/investment_response.dart';

part 'api_client1.g.dart';

@RestApi(baseUrl: "https://antworksmoney.com/")
abstract class APIClient1 {
  factory APIClient1(Dio dio, {String baseUrl}) = _APIClient1;
  @POST("financial_buddy/loanoffer")
  Future<dynamic> getLoanStatus1(
    @Header("oath_token") String authValue,
    @Header("Authorization") String oAuthTokenValue,
    @Body() LoanRequestModel loan,
  );
  @POST("app/ScoreApi/ScoreApi/")
  Future<CreditScoreResponse> getCreditScore(
    @Header("secret") String secret,
    @Header("client_id") String clientId,
    @Header("oath_token") String authValue,
    @Header("Authorization") String authorization,
    @Body() CreditScoreRequest data,
  );

    @GET('financial_buddy/investment_product')
  Future<InvestmentResponse> fetchInvestmentProduct(
     @Header("oath_token") String authValue,
      @Header("Authorization") String oAuthTokenValue,
  );
}
