
import 'package:json_annotation/json_annotation.dart';

part 'getOperator.g.dart';

@JsonSerializable()
class OperatorResponse  {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'Operator_Name')
  final String? operatorName;

  @JsonKey(name: 'service')
  final String? service;

  @JsonKey(name: 'State')
  final String? state;

  @JsonKey(name: 'City')
  final String? city;

  @JsonKey(name: 'Partial')
  final String? partial;

  @JsonKey(name: 'Operator_Code')
  final String? operatorCode;

  @JsonKey(name: 'Service_Name')
  final String? serviceName;

  @JsonKey(name: 'service_categories_img')
  final String? serviceCategoriesImg;

  @JsonKey(name: 'Number_Tag')
  final String? numberTag;

  @JsonKey(name: 'Number_validation')
  final String? numberValidation;

  @JsonKey(name: 'Field1_Tag')
  final String? field1Tag;

  @JsonKey(name: 'Field1_validation')
  final String? field1Validation;

  @JsonKey(name: 'Field2_Tag')
  final String? field2Tag;

  @JsonKey(name: 'Field2_validation')
  final String? field2Validation;

  @JsonKey(name: 'Field3_Tag')
  final String? field3Tag;

  @JsonKey(name: 'Field3_validation')
  final String? field3Validation;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'created_date')
  final String? createdDate;

  OperatorResponse ({
    this.id,
    this.operatorName,
    this.service,
    this.state,
    this.city,
    this.partial,
    this.operatorCode,
    this.serviceName,
    this.serviceCategoriesImg,
    this.numberTag,
    this.numberValidation,
    this.field1Tag,
    this.field1Validation,
    this.field2Tag,
    this.field2Validation,
    this.field3Tag,
    this.field3Validation,
    this.status,
    this.createdDate,
  });

  factory OperatorResponse.fromJson(Map<String, dynamic> json) =>
      _$OperatorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorResponseToJson(this);
}


//to store response of profileUpdate via POST Call

//verify otp POST body class
@JsonSerializable()
class getOperatorRequestModel {


  getOperatorRequestModel({
    // this.getOperatorName,
    this.Operator_Code,
    this.aParam
  });

  @JsonKey(name: 'Operator_Code')
  String? Operator_Code;

  @JsonKey(name: 'aParam')
  String? aParam;

  factory getOperatorRequestModel.fromJson(Map<String, dynamic> json) =>
      _$getOperatorRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$getOperatorRequestModelToJson(this);
}
