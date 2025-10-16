
import 'package:json_annotation/json_annotation.dart';

part 'social_after_payment_model.g.dart';

@JsonSerializable()
class SocialAfterPaymentRequestModel{

  SocialAfterPaymentRequestModel({
    this.aParam,
    this.ant_txn_id,
    this.mobile,
    this.amount,
    this.payment_method,
    this.service,
    this.razorpay_order_id,
    this.razorpay_payment_id,
    this.razorpay_signature,
    this.source
});

  @JsonKey(name:'ant_txn_id')
  String? ant_txn_id;

@JsonKey(name:'aParam')
  String? aParam;

  @JsonKey(name:'mobile')
  String? mobile;

  @JsonKey(name:'amount')
  String? amount;

  @JsonKey(name:'payment_method')
  String? payment_method;

  @JsonKey(name:'service')
  String? service;

  @JsonKey(name:'razorpay_order_id')
  String? razorpay_order_id;

  @JsonKey(name:'razorpay_payment_id')
  String? razorpay_payment_id;

  @JsonKey(name:'razorpay_signature')
  String? razorpay_signature;

  @JsonKey(name:'source')
  String? source;

  factory SocialAfterPaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SocialAfterPaymentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialAfterPaymentRequestModelToJson(this);

}

@JsonSerializable()
class SocialAfterPaymentResponseModel{
  SocialAfterPaymentResponseModel({
    this.status
});

  @JsonKey(name:'status')
  dynamic status;

  factory SocialAfterPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SocialAfterPaymentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialAfterPaymentResponseModelToJson(this);

}