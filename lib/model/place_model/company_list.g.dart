// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyList _$CompanyListFromJson(Map<String, dynamic> json) => CompanyList(
      company_list: (json['company_list'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyListToJson(CompanyList instance) =>
    <String, dynamic>{
      'company_list': instance.company_list,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as String?,
      companyName: json['company_name'] as String?,
      companyCategory: json['company_category'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'company_name': instance.companyName,
      'company_category': instance.companyCategory,
    };
