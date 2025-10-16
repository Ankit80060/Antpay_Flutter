import 'package:json_annotation/json_annotation.dart';

part 'coupon_resmodel.g.dart';

@JsonSerializable()
class CouponResModel {
  @JsonKey(name: "offer_list")
  List<OfferModel>? offerList;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "msg")
  String? msg;

  CouponResModel({
    this.offerList,
    this.status,
    this.msg,
  });

  factory CouponResModel.fromJson(Map<String, dynamic> json) =>
      _$CouponResModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponResModelToJson(this);
}

@JsonSerializable()
class OfferModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "offer_name")
  String? offerName;
  @JsonKey(name: "category_name")
  String? categoryName;
  @JsonKey(name: "offer_type")
  String? offerType;
  @JsonKey(name: "coupon_code_type")
  String? couponCodeType;
  @JsonKey(name: "coupon_code")
  String? coupon_code;
  @JsonKey(name: "min_transaction_amount")
  String? minTransactionAmount;
  @JsonKey(name: "offer_icon_img")
  String? offerIconImg;
  @JsonKey(name: "offer_banner_img")
  String? offerBannerImg;
  @JsonKey(name: "company_icon_img")
  String? companyIconImg;
  @JsonKey(name: "offer_url")
  String? offerUrl;
  @JsonKey(name: "app_id")
  String? appId;
  @JsonKey(name: "play_store_url")
  String? playStoreUrl;
  @JsonKey(name: "status")
  String? status;



  OfferModel({
    this.id,
    this.offerName,
    this.categoryName,
    this.offerType,
    this.couponCodeType,
    this.coupon_code,
    this.minTransactionAmount,
    this.offerIconImg,
    this.offerBannerImg,
    this.companyIconImg,
    this.offerUrl,
    this.appId,
    this.playStoreUrl,
    this.status,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferModelToJson(this);


}
