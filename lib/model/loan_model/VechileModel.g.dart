// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VechileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehcileData _$VehcileDataFromJson(Map<String, dynamic> json) => VehcileData(
      status: (json['status'] as num).toInt(),
      msg: json['message'] as String,
      models: (json['data'] as List<dynamic>)
          .map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehcileDataToJson(VehcileData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.msg,
      'data': instance.models,
    };

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      vehiclemodelcode: json['vehiclemodelcode'] as String,
      vehiclemodelVariante: json['vehiclemodelVariante'] as String,
      txtFuel: json['txt_fuel'] as String,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'vehiclemodelcode': instance.vehiclemodelcode,
      'vehiclemodelVariante': instance.vehiclemodelVariante,
      'txt_fuel': instance.txtFuel,
    };
