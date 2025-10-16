import 'package:json_annotation/json_annotation.dart';

part 'credit_card_model.g.dart';

@JsonSerializable()
class CreditCardResponse {
  CreditCardResponse({
    this.status,
    this.msg,
    this.data,
  });

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'data')
  List<CreditCardModel>? data;

  factory CreditCardResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardResponseToJson(this);
}

@JsonSerializable()
class CreditCardModel {
  CreditCardModel({
    this.id,
    this.creditCardName,
    this.bankUrl,
    this.annualFee,
    this.joiningFee,
    this.cardImg,
    this.bannerImage,
    this.keyFeatures,
  });

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'credit_card_name')
  String? creditCardName;

  @JsonKey(name: 'bank_url')
  String? bankUrl;

  @JsonKey(name: 'annual_fee')
  String? annualFee;

  @JsonKey(name: 'joining_fee')
  String? joiningFee;

  @JsonKey(name: 'card_img')
  String? cardImg;

  @JsonKey(name: 'banner_image')
  String? bannerImage;

  @JsonKey(name: 'key_features')
  List<KeyFeature>? keyFeatures;

  factory CreditCardModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardModelToJson(this);
}

@JsonSerializable()
class KeyFeature {
  KeyFeature({
    this.title,
    this.description,
  });

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  factory KeyFeature.fromJson(Map<String, dynamic> json) =>
      _$KeyFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$KeyFeatureToJson(this);
}
