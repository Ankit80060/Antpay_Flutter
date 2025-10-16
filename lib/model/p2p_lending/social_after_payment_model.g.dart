// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_after_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialAfterPaymentRequestModel _$SocialAfterPaymentRequestModelFromJson(
        Map<String, dynamic> json) =>
    SocialAfterPaymentRequestModel(
      aParam: json['aParam'] as String?,
      ant_txn_id: json['ant_txn_id'] as String?,
      mobile: json['mobile'] as String?,
      amount: json['amount'] as String?,
      payment_method: json['payment_method'] as String?,
      service: json['service'] as String?,
      razorpay_order_id: json['razorpay_order_id'] as String?,
      razorpay_payment_id: json['razorpay_payment_id'] as String?,
      razorpay_signature: json['razorpay_signature'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$SocialAfterPaymentRequestModelToJson(
        SocialAfterPaymentRequestModel instance) =>
    <String, dynamic>{
      'ant_txn_id': instance.ant_txn_id,
      'aParam': instance.aParam,
      'mobile': instance.mobile,
      'amount': instance.amount,
      'payment_method': instance.payment_method,
      'service': instance.service,
      'razorpay_order_id': instance.razorpay_order_id,
      'razorpay_payment_id': instance.razorpay_payment_id,
      'razorpay_signature': instance.razorpay_signature,
      'source': instance.source,
    };

SocialAfterPaymentResponseModel _$SocialAfterPaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    SocialAfterPaymentResponseModel(
      status: json['status'],
    );

Map<String, dynamic> _$SocialAfterPaymentResponseModelToJson(
        SocialAfterPaymentResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
