// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getOperator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperatorResponse _$OperatorResponseFromJson(Map<String, dynamic> json) =>
    OperatorResponse(
      id: json['id'] as String?,
      operatorName: json['Operator_Name'] as String?,
      service: json['service'] as String?,
      state: json['State'] as String?,
      city: json['City'] as String?,
      partial: json['Partial'] as String?,
      operatorCode: json['Operator_Code'] as String?,
      serviceName: json['Service_Name'] as String?,
      serviceCategoriesImg: json['service_categories_img'] as String?,
      numberTag: json['Number_Tag'] as String?,
      numberValidation: json['Number_validation'] as String?,
      field1Tag: json['Field1_Tag'] as String?,
      field1Validation: json['Field1_validation'] as String?,
      field2Tag: json['Field2_Tag'] as String?,
      field2Validation: json['Field2_validation'] as String?,
      field3Tag: json['Field3_Tag'] as String?,
      field3Validation: json['Field3_validation'] as String?,
      status: json['status'] as String?,
      createdDate: json['created_date'] as String?,
    );

Map<String, dynamic> _$OperatorResponseToJson(OperatorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Operator_Name': instance.operatorName,
      'service': instance.service,
      'State': instance.state,
      'City': instance.city,
      'Partial': instance.partial,
      'Operator_Code': instance.operatorCode,
      'Service_Name': instance.serviceName,
      'service_categories_img': instance.serviceCategoriesImg,
      'Number_Tag': instance.numberTag,
      'Number_validation': instance.numberValidation,
      'Field1_Tag': instance.field1Tag,
      'Field1_validation': instance.field1Validation,
      'Field2_Tag': instance.field2Tag,
      'Field2_validation': instance.field2Validation,
      'Field3_Tag': instance.field3Tag,
      'Field3_validation': instance.field3Validation,
      'status': instance.status,
      'created_date': instance.createdDate,
    };

getOperatorRequestModel _$getOperatorRequestModelFromJson(
        Map<String, dynamic> json) =>
    getOperatorRequestModel(
      Operator_Code: json['Operator_Code'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$getOperatorRequestModelToJson(
        getOperatorRequestModel instance) =>
    <String, dynamic>{
      'Operator_Code': instance.Operator_Code,
      'aParam': instance.aParam,
    };
