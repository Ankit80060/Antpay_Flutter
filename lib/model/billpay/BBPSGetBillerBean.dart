import 'package:json_annotation/json_annotation.dart';
part 'BBPSGetBillerBean.g.dart';

@JsonSerializable()
class HealthInsuranceRequestModel {
  HealthInsuranceRequestModel({this.billerCategory,this.aParam});

  @JsonKey(name: 'billerCategory')
  String? billerCategory;

  @JsonKey(name: 'aParam')
  String? aParam;

  factory HealthInsuranceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HealthInsuranceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$HealthInsuranceRequestModelToJson(this);
}

@JsonSerializable()
class HealthInsuranceResponseModel {
  HealthInsuranceResponseModel({this.status, this.msg, this.billers});

  @JsonKey(name: 'status')
  dynamic status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'biller')
  List<Billers>? billers;

  factory HealthInsuranceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HealthInsuranceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HealthInsuranceResponseModelToJson(this);
}

@JsonSerializable()
class Billers {
  Billers(
      {this.id,
      this.billerCategory,
      this.billerName,
      this.billerId,
      this.billerAdhoc,
      this.billerCoverage,
      this.billerFetchRequiremet,
      this.billerPaymentExactness});

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'billerCategory')
  String? billerCategory;

  @JsonKey(name: 'billerName')
  String? billerName;

  @JsonKey(name: 'billerId')
  String? billerId;

  @JsonKey(name: 'billerAdhoc')
  String? billerAdhoc;

  @JsonKey(name: 'billerCoverage')
  String? billerCoverage;

  @JsonKey(name: 'billerFetchRequiremet')
  String? billerFetchRequiremet;

  @JsonKey(name: 'billerPaymentExactness')
  String? billerPaymentExactness;

  factory Billers.fromJson(Map<String, dynamic> json) =>
      _$BillersFromJson(json);

  Map<String, dynamic> toJson() => _$BillersToJson(this);
}
