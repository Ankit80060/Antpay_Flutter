import 'package:json_annotation/json_annotation.dart';
part 'BillersLifeInsurance.g.dart';

// Req Model

@JsonSerializable()
class BillersRequestModel {
  @JsonKey(name: 'billerId')
  final String billerId;

  @JsonKey(name: 'aParam')
  final String aParam;

  BillersRequestModel({
    required this.billerId,
    required this.aParam,
  });

  factory BillersRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BillersRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillersRequestModelToJson(this);
}

@JsonSerializable()
class BillersLifeInsurance{
  BillersLifeInsurance({
    this.inputfield,
    this.status,
    this.msg,
  });


  @JsonKey(name: 'billers')
  List<BillerInputFields>? inputfield;

  @JsonKey(name: 'status')
  dynamic status;

 @JsonKey(name: 'msg')
  String? msg;


  factory BillersLifeInsurance.fromJson(Map<String, dynamic> json) =>
      _$BillersLifeInsuranceFromJson(json);

  Map<String, dynamic> toJson() => _$BillersLifeInsuranceToJson(this);
}

@JsonSerializable()
class BillerInputFields {
  BillerInputFields({
    this.id,
    this.billerId,
    this.paramName,
    this.dataType,
    this.isOptional,
    this.minLength,
    this.maxLength,
    this.regEx,
    this.billerPaymentExactness,
    this.biller_full_response,

  });

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'billerId')
  String? billerId;

  @JsonKey(name: 'paramName')
  String? paramName;

  @JsonKey(name: 'dataType')
  String? dataType;

  @JsonKey(name: 'isOptional')
  String? isOptional;

  @JsonKey(name: 'minLength')
  String? minLength;

  @JsonKey(name: 'maxLength')
  String? maxLength;

  @JsonKey(name: 'regEx')
  String? regEx;

  @JsonKey(name: 'billerPaymentExactness')
  String? billerPaymentExactness;

  @JsonKey(name: 'biller_full_response')
  String? biller_full_response;


  factory BillerInputFields.fromJson(Map<String, dynamic> json) =>
      _$BillerInputFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$BillerInputFieldsToJson(this);

}

//verify otp POST body class
@JsonSerializable()
class billersRequestModelNew{

  billersRequestModelNew({
    this.billerCategory
  });

  @JsonKey(name: 'billerId')
  String? billerCategory;


  factory billersRequestModelNew.fromJson(Map<String, dynamic> json) =>
      _$billersRequestModelNewFromJson(json);

  Map<String, dynamic> toJson() => _$billersRequestModelNewToJson(this);


}