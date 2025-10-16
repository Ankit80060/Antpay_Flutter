

import 'package:json_annotation/json_annotation.dart';
part 'point_balance_model.g.dart';

@JsonSerializable()
class PointBalanceRequestModel{
  PointBalanceRequestModel({
    this.mobile,
    this.aParam
});

  @JsonKey(name:'mobile')
  String? mobile;

  @JsonKey(name:'aParam')
  String? aParam;

  factory PointBalanceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PointBalanceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PointBalanceRequestModelToJson(this);


}

@JsonSerializable()
class PointBalanceResponseModel{
  PointBalanceResponseModel({
    this.status,
    this.point,
    this.msg,

});

  @JsonKey(name:'status')
  dynamic? status;

  @JsonKey(name:'point')
  String? point;

  @JsonKey(name:'msg')
  String? msg;

  factory PointBalanceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PointBalanceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PointBalanceResponseModelToJson(this);

}