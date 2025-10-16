import 'package:antpay_lite/model/place_model/bank_list_model.dart';
import 'package:antpay_lite/model/place_model/city_model.dart';
import 'package:antpay_lite/model/place_model/company_list.dart';
import 'package:antpay_lite/model/place_model/company_type_model.dart';
import 'package:antpay_lite/model/place_model/occupation_model.dart';
import 'package:antpay_lite/model/place_model/qualification_model.dart';
import 'package:antpay_lite/model/place_model/state_code_request.dart';
import 'package:antpay_lite/model/place_model/state_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'p2p_api_client.g.dart';

@RestApi(baseUrl: "https://antworksp2p.com/")
abstract class P2PApiClient {
  factory P2PApiClient(Dio dio, {String baseUrl}) = _P2PApiClient;

  @GET("credit-line/Commonapi/getState")
  Future<StateModel> getStateList();

  @POST("credit-line/commonapi/cityList")
  Future<CityListResponse> getCityList(
      @Body() StateCodeRequest stateCodeRequest);

  @GET("credit-line/commonapi/getQualification")
  Future<Qualification> getQualifications();

  @GET("credit-line/commonapi/getOccuption")
  Future<Occupation> getOccupations();

  @GET("credit-line/commonapi/company_type")
  Future<CompanyType> getCompanyType();

  @GET("credit-line/commonapi/getBanklist")
  Future<Banks> getBankList();

  @GET("/credit-line/commonapi/company_list")
  Future<CompanyList> getCompanyList();
}
