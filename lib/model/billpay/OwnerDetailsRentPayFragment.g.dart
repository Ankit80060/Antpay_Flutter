// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OwnerDetailsRentPayFragment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerDetailsRentPayFragmentModel _$OwnerDetailsRentPayFragmentModelFromJson(
        Map<String, dynamic> json) =>
    OwnerDetailsRentPayFragmentModel(
      status: json['status'],
      rent_pay_id: json['rent_pay_id'],
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$OwnerDetailsRentPayFragmentModelToJson(
        OwnerDetailsRentPayFragmentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'rent_pay_id': instance.rent_pay_id,
      'msg': instance.msg,
    };

OwnerDetailsRentPayFragmentRequestModel
    _$OwnerDetailsRentPayFragmentRequestModelFromJson(
            Map<String, dynamic> json) =>
        OwnerDetailsRentPayFragmentRequestModel(
          mobile: json['mobile'] as String?,
          owner_mobile: json['owner_mobile'] as String?,
          name: json['name'] as String?,
          amount: json['amount'] as String?,
          month: json['month'] as String?,
          address: json['address'] as String?,
        );

Map<String, dynamic> _$OwnerDetailsRentPayFragmentRequestModelToJson(
        OwnerDetailsRentPayFragmentRequestModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'owner_mobile': instance.owner_mobile,
      'name': instance.name,
      'amount': instance.amount,
      'month': instance.month,
      'address': instance.address,
    };
