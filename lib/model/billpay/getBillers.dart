
import 'package:json_annotation/json_annotation.dart';

part 'getBillers.g.dart';

@JsonSerializable()
class GetBillersServiceRes{
  GetBillersServiceRes({
    this.status, this.msg, this.results,
  });
   @JsonKey(name: 'status')
  dynamic status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'results')
  List<ServiceResultModel>? results;


  factory GetBillersServiceRes.fromJson(Map<String, dynamic> json) =>
      _$GetBillersServiceResFromJson(json);

  Map<String, dynamic> toJson() => _$GetBillersServiceResToJson(this);
}

@JsonSerializable()
class ServiceResultModel {
  ServiceResultModel({
    this.id,
    this.Operator_Name,
    this.service,
    this.State,
    this.City,
    this.Partial,
    this.Operator_Code,
    this.Service_Name,
    this.service_categories_img,
    this.Number_Tag,
    this.Number_validation,
    this.Field1_Tag,
    this.Field1_validation,
    this.Field2_Tag,
    this.Field2_validation,
    this.Field3_Tag,
    this.Field3_validation,
    this.created_date,


  });

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'Operator_Name')
  String? Operator_Name;

  @JsonKey(name: 'service')
  String? service;

  @JsonKey(name: 'State')
  String? State;

  @JsonKey(name: 'City')
  String? City;

  @JsonKey(name: 'Partial')
  String? Partial;

  @JsonKey(name: 'Operator_Code')
  String? Operator_Code;

  @JsonKey(name: 'Service_Name')
  String? Service_Name;

  @JsonKey(name: 'service_categories_img')
  String? service_categories_img;

  @JsonKey(name: 'Number_Tag')
  String? Number_Tag;

  @JsonKey(name: 'Number_validation')
  String? Number_validation;

  @JsonKey(name: 'Field1_Tag')
  String? Field1_Tag;

  @JsonKey(name: 'Field1_validation')
  String? Field1_validation;

  @JsonKey(name: 'Field2_Tag')
  String? Field2_Tag;

  @JsonKey(name: 'Field2_validation')
  String? Field2_validation;

  @JsonKey(name: 'Field3_Tag')
  String? Field3_Tag;

  @JsonKey(name: 'Field3_validation')
  String? Field3_validation;

  @JsonKey(name: 'created_date')
  String? created_date;

  factory ServiceResultModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceResultModelToJson(this);

}


//verify otp POST body class
@JsonSerializable()
 class BillersServiceReqModel{

  BillersServiceReqModel({
    this.Service_Name
  });

  @JsonKey(name: 'Service_Name')
  String? Service_Name;


  factory BillersServiceReqModel.fromJson(Map<String, dynamic> json) =>
      _$BillersServiceReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillersServiceReqModelToJson(this);


}
