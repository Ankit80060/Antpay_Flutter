// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCardResponse _$CreditCardResponseFromJson(Map<String, dynamic> json) =>
    CreditCardResponse(
      status: json['status'] as String?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CreditCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditCardResponseToJson(CreditCardResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

CreditCardModel _$CreditCardModelFromJson(Map<String, dynamic> json) =>
    CreditCardModel(
      id: json['id'] as String?,
      creditCardName: json['credit_card_name'] as String?,
      bankUrl: json['bank_url'] as String?,
      annualFee: json['annual_fee'] as String?,
      joiningFee: json['joining_fee'] as String?,
      cardImg: json['card_img'] as String?,
      bannerImage: json['banner_image'] as String?,
      keyFeatures: (json['key_features'] as List<dynamic>?)
          ?.map((e) => KeyFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditCardModelToJson(CreditCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_card_name': instance.creditCardName,
      'bank_url': instance.bankUrl,
      'annual_fee': instance.annualFee,
      'joining_fee': instance.joiningFee,
      'card_img': instance.cardImg,
      'banner_image': instance.bannerImage,
      'key_features': instance.keyFeatures,
    };

KeyFeature _$KeyFeatureFromJson(Map<String, dynamic> json) => KeyFeature(
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$KeyFeatureToJson(KeyFeature instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
