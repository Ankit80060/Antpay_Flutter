import 'package:json_annotation/json_annotation.dart';

import 'coupon_resmodel.dart';

part 'get_category_pojo.g.dart';

@JsonSerializable()
class GetCategoryPOJO {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "results")
  List<RewardResult>? result;
  @JsonKey(name: "msg")
  String? msg;

  GetCategoryPOJO({
    this.status,
    this.result,
    this.msg,
  });

  factory GetCategoryPOJO.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryPOJOFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoryPOJOToJson(this);
}

@JsonSerializable()
class RewardResult {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "category_name")
  String? categoryName;
  @JsonKey(name: "category_status")
  String? categoryStatus;
  @JsonKey(name: "created_date")
  String? createdDate;

  RewardResult(
      {this.id, this.categoryName, this.categoryStatus, this.createdDate});

  factory RewardResult.fromJson(Map<String, dynamic> json) =>
      _$RewardResultFromJson(json);

  Map<String, dynamic> toJson() => _$RewardResultToJson(this);
}

@JsonSerializable()
class GetOfferByCategoryResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "results")
  @ResultConverter()
  List<rewardOfferModel>? offerModels;
  @JsonKey(name: "msg")
  String? msg;

  GetOfferByCategoryResponse({
    this.status,
    this.offerModels,
    this.msg,
  });

  factory GetOfferByCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOfferByCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOfferByCategoryResponseToJson(this);

}

class ResultConverter
    implements JsonConverter<List<rewardOfferModel>?, Object?> {
  const ResultConverter();

  @override
  List<rewardOfferModel>? fromJson(Object? json) {
    if (json is List) {
      return json
          .map((e) => rewardOfferModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return <rewardOfferModel>[]; // fallback when results = "" or not a list
  }

  @override
  Object? toJson(List<rewardOfferModel>? object) {
    return object?.map((e) => e.toJson()).toList() ?? [];
  }
}


@JsonSerializable()
class rewardOfferModel {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "offer_name")
  String? offerName;

  @JsonKey(name: "category_id")
  String? categoryId;
  @JsonKey(name: "offer_validity")
  String? offerValidity;
  @JsonKey(name: "offer_type")
  String? offerType;
  @JsonKey(name: "coupon_code_type")
  String? couponCodeType;
  @JsonKey(name: "discount_reward_type")
  String? discountRewardType;
  @JsonKey(name: "min_transaction_amount")
  String? minTransactionAmount;
  @JsonKey(name: "max_transaction_amount")
  String? maxTransactionAmount;
  @JsonKey(name: "discount_worth")
  String? discountWorth;
  @JsonKey(name: "max_reward")
  String? maxReward;
  @JsonKey(name: "payment_method")
  List<String>? paymentMethod;

  @JsonKey(name: "bank")
  List<String>? bank;
  @JsonKey(name: "bin_inn")
  String? binInn;
  @JsonKey(name: "offer_short_description")
  String? offerShortDescription;
  @JsonKey(name: "offer_long_description")
  String? offerLongDescription;
  @JsonKey(name: "term_condition")
  String? termCondition;
  @JsonKey(name: "about_company")
  String? aboutCompany;
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
  @JsonKey(name: "created_date")
  String? createdDate;

  rewardOfferModel({
    this.id,
    this.offerName,
    this.categoryId,
    this.offerValidity,
    this.offerType,
    this.couponCodeType,
    this.discountRewardType,
    this.minTransactionAmount,
    this.maxTransactionAmount,
    this.discountWorth,
    this.maxReward,
    this.paymentMethod,

  });

  factory rewardOfferModel.fromJson(Map<String, dynamic> json) =>
      _$rewardOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$rewardOfferModelToJson(this);



}
