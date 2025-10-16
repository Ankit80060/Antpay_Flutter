import 'package:json_annotation/json_annotation.dart';

part 'social_payment_generate_order_model.g.dart';

@JsonSerializable()
class SocialPaymentGenerateOrderRequestModel{

  SocialPaymentGenerateOrderRequestModel({
    this.amount,
    this.channel,
    this.mobile,
    this.service,
    this.source,
});

  @JsonKey(name:'amount')
  String? amount;

  @JsonKey(name:'channel')
  String? channel;

  @JsonKey(name:'mobile')
  String? mobile;

  @JsonKey(name:'service')
  String? service;

  @JsonKey(name:'source')
  String? source;

  factory SocialPaymentGenerateOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SocialPaymentGenerateOrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialPaymentGenerateOrderRequestModelToJson(this);

}
@JsonSerializable()
class SocialPaymentGenerateOrderResponseModel{

  SocialPaymentGenerateOrderResponseModel({
    this.status,
    this.ant_txn_id,
    this.fee,
    this.amount,
    this.final_amount,
    this.order_id,
    this.api_key,
    this.pg_type,
    this.channel,
    this.msg
});

  @JsonKey(name:'status')
  dynamic? status;

  @JsonKey(name:'ant_txn_id')
  String? ant_txn_id;

  @JsonKey(name:'fee')
  int? fee;

  @JsonKey(name:'amount')
 int? amount;

  @JsonKey(name:'final_amount')
  int? final_amount;

  @JsonKey(name:'order_id')
  String? order_id;

  @JsonKey(name:'api_key')
  String? api_key;

  @JsonKey(name:'pg_type')
  String? pg_type;

  @JsonKey(name:'channel')
  String? channel;

  @JsonKey(name:'msg')
  String? msg;

  factory SocialPaymentGenerateOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SocialPaymentGenerateOrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialPaymentGenerateOrderResponseModelToJson(this);




}