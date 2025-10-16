// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyResponse _$CompanyResponseFromJson(Map<String, dynamic> json) =>
    CompanyResponse(
      status: (json['status'] as num?)?.toInt(),
      companyList: (json['company_list'] as List<dynamic>?)
          ?.map((e) => CompanyList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyResponseToJson(CompanyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'company_list': instance.companyList,
    };

CompanyList _$CompanyListFromJson(Map<String, dynamic> json) => CompanyList(
      id: json['id'] as String?,
      companyName: json['company_name'] as String?,
      companyCategory: json['company_category'] as String?,
    );

Map<String, dynamic> _$CompanyListToJson(CompanyList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_name': instance.companyName,
      'company_category': instance.companyCategory,
    };
