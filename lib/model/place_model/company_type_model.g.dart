// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyType _$CompanyTypeFromJson(Map<String, dynamic> json) => CompanyType(
      list: (json['company_type'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CompanyTypeToJson(CompanyType instance) =>
    <String, dynamic>{
      'company_type': instance.list,
    };
