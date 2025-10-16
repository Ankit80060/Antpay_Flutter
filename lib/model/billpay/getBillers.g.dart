// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getBillers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBillersServiceRes _$GetBillersServiceResFromJson(
        Map<String, dynamic> json) =>
    GetBillersServiceRes(
      status: json['status'],
      msg: json['msg'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ServiceResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBillersServiceResToJson(
        GetBillersServiceRes instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'results': instance.results,
    };

ServiceResultModel _$ServiceResultModelFromJson(Map<String, dynamic> json) =>
    ServiceResultModel(
      id: json['id'] as String?,
      Operator_Name: json['Operator_Name'] as String?,
      service: json['service'] as String?,
      State: json['State'] as String?,
      City: json['City'] as String?,
      Partial: json['Partial'] as String?,
      Operator_Code: json['Operator_Code'] as String?,
      Service_Name: json['Service_Name'] as String?,
      service_categories_img: json['service_categories_img'] as String?,
      Number_Tag: json['Number_Tag'] as String?,
      Number_validation: json['Number_validation'] as String?,
      Field1_Tag: json['Field1_Tag'] as String?,
      Field1_validation: json['Field1_validation'] as String?,
      Field2_Tag: json['Field2_Tag'] as String?,
      Field2_validation: json['Field2_validation'] as String?,
      Field3_Tag: json['Field3_Tag'] as String?,
      Field3_validation: json['Field3_validation'] as String?,
      created_date: json['created_date'] as String?,
    );

Map<String, dynamic> _$ServiceResultModelToJson(ServiceResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Operator_Name': instance.Operator_Name,
      'service': instance.service,
      'State': instance.State,
      'City': instance.City,
      'Partial': instance.Partial,
      'Operator_Code': instance.Operator_Code,
      'Service_Name': instance.Service_Name,
      'service_categories_img': instance.service_categories_img,
      'Number_Tag': instance.Number_Tag,
      'Number_validation': instance.Number_validation,
      'Field1_Tag': instance.Field1_Tag,
      'Field1_validation': instance.Field1_validation,
      'Field2_Tag': instance.Field2_Tag,
      'Field2_validation': instance.Field2_validation,
      'Field3_Tag': instance.Field3_Tag,
      'Field3_validation': instance.Field3_validation,
      'created_date': instance.created_date,
    };

BillersServiceReqModel _$BillersServiceReqModelFromJson(
        Map<String, dynamic> json) =>
    BillersServiceReqModel(
      Service_Name: json['Service_Name'] as String?,
    );

Map<String, dynamic> _$BillersServiceReqModelToJson(
        BillersServiceReqModel instance) =>
    <String, dynamic>{
      'Service_Name': instance.Service_Name,
    };
