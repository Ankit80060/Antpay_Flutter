// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RtoResponse _$RtoResponseFromJson(Map<String, dynamic> json) => RtoResponse(
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => RtoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RtoResponseToJson(RtoResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

RtoData _$RtoDataFromJson(Map<String, dynamic> json) => RtoData(
      id: json['id'] as String,
      rtoCode: json['rto_code'] as String,
      registrationStateCity: json['registration_state_city'] as String,
      registrationStateCityCode: json['registration_state_city_code'] as String,
      vehicleClassCode: json['vehicle_class_code'] as String,
      numStateId: json['num_state_id'] as String,
      txtStateSubName: json['txt_state_sub_name'] as String,
      numStateSubCode: json['num_state_sub_code'] as String,
      product: json['product'] as String,
    );

Map<String, dynamic> _$RtoDataToJson(RtoData instance) => <String, dynamic>{
      'id': instance.id,
      'rto_code': instance.rtoCode,
      'registration_state_city': instance.registrationStateCity,
      'registration_state_city_code': instance.registrationStateCityCode,
      'vehicle_class_code': instance.vehicleClassCode,
      'num_state_id': instance.numStateId,
      'txt_state_sub_name': instance.txtStateSubName,
      'num_state_sub_code': instance.numStateSubCode,
      'product': instance.product,
    };
