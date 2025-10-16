// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_resmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponResModel _$CouponResModelFromJson(Map<String, dynamic> json) =>
    CouponResModel(
      offerList: (json['offer_list'] as List<dynamic>?)
          ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$CouponResModelToJson(CouponResModel instance) =>
    <String, dynamic>{
      'offer_list': instance.offerList,
      'status': instance.status,
      'msg': instance.msg,
    };

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => OfferModel(
      id: json['id'] as String?,
      offerName: json['offer_name'] as String?,
      categoryName: json['category_name'] as String?,
      offerType: json['offer_type'] as String?,
      couponCodeType: json['coupon_code_type'] as String?,
      coupon_code: json['coupon_code'] as String?,
      minTransactionAmount: json['min_transaction_amount'] as String?,
      offerIconImg: json['offer_icon_img'] as String?,
      offerBannerImg: json['offer_banner_img'] as String?,
      companyIconImg: json['company_icon_img'] as String?,
      offerUrl: json['offer_url'] as String?,
      appId: json['app_id'] as String?,
      playStoreUrl: json['play_store_url'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'offer_name': instance.offerName,
      'category_name': instance.categoryName,
      'offer_type': instance.offerType,
      'coupon_code_type': instance.couponCodeType,
      'coupon_code': instance.coupon_code,
      'min_transaction_amount': instance.minTransactionAmount,
      'offer_icon_img': instance.offerIconImg,
      'offer_banner_img': instance.offerBannerImg,
      'company_icon_img': instance.companyIconImg,
      'offer_url': instance.offerUrl,
      'app_id': instance.appId,
      'play_store_url': instance.playStoreUrl,
      'status': instance.status,
    };
