// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BrandModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => BrandModel(
      status: (json['status'] as num?)?.toInt(),
      msg: json['message'] as String?,
      brands: (json['data'] as List<dynamic>?)
          ?.map((e) => Brands.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.msg,
      'data': instance.brands,
    };

Brands _$BrandsFromJson(Map<String, dynamic> json) => Brands(
      id: json['id'] as String?,
      manufacturer: json['manufacturer'] as String?,
      vehiclemodelcode: json['vehiclemodelcode'] as String?,
      vehiclemodel: json['vehiclemodel'] as String?,
      numberofwheels: json['numberofwheels'] as String?,
      cubiccapacity: json['cubiccapacity'] as String?,
      grossvehicleweight: json['grossvehicleweight'] as String?,
      seatingcapacity: json['seatingcapacity'] as String?,
      carringcapacity: json['carringcapacity'] as String?,
      txt_fuel: json['txt_fuel'] as String?,
      txt_variant: json['txt_variant'] as String?,
    );

Map<String, dynamic> _$BrandsToJson(Brands instance) => <String, dynamic>{
      'id': instance.id,
      'manufacturer': instance.manufacturer,
      'vehiclemodelcode': instance.vehiclemodelcode,
      'vehiclemodel': instance.vehiclemodel,
      'numberofwheels': instance.numberofwheels,
      'cubiccapacity': instance.cubiccapacity,
      'grossvehicleweight': instance.grossvehicleweight,
      'seatingcapacity': instance.seatingcapacity,
      'carringcapacity': instance.carringcapacity,
      'txt_fuel': instance.txt_fuel,
      'txt_variant': instance.txt_variant,
    };
