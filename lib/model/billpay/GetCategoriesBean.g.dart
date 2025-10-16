// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetCategoriesBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemesInvestmentResonseModel _$SchemesInvestmentResonseModelFromJson(
        Map<String, dynamic> json) =>
    SchemesInvestmentResonseModel(
      schemesList: (json['results'] as List<dynamic>?)
          ?.map((e) => results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchemesInvestmentResonseModelToJson(
        SchemesInvestmentResonseModel instance) =>
    <String, dynamic>{
      'results': instance.schemesList,
    };

results _$resultsFromJson(Map<String, dynamic> json) => results(
      Service_Name: json['Service_Name'] as String?,
      service: json['service'] as String?,
      service_categories_img: json['service_categories_img'] as String?,
      service_categories_img_new: json['service_categories_img_new'] as String?,
    );

Map<String, dynamic> _$resultsToJson(results instance) => <String, dynamic>{
      'Service_Name': instance.Service_Name,
      'service': instance.service,
      'service_categories_img': instance.service_categories_img,
      'service_categories_img_new': instance.service_categories_img_new,
    };
