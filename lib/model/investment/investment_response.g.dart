// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentResponse _$InvestmentResponseFromJson(Map<String, dynamic> json) =>
    InvestmentResponse(
      userData: (json['UserData'] as List<dynamic>?)
          ?.map((e) => InvestmentProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvestmentResponseToJson(InvestmentResponse instance) =>
    <String, dynamic>{
      'UserData': instance.userData,
    };

InvestmentProduct _$InvestmentProductFromJson(Map<String, dynamic> json) =>
    InvestmentProduct(
      id: json['id'] as String?,
      investmentProduct: json['investment_product'] as String?,
      iconUrl: json['icon_url'] as String?,
      iconUrlNew: json['icon_url_new'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$InvestmentProductToJson(InvestmentProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'investment_product': instance.investmentProduct,
      'icon_url': instance.iconUrl,
      'icon_url_new': instance.iconUrlNew,
      'status': instance.status,
    };
