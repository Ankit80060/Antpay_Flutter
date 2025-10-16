import 'package:json_annotation/json_annotation.dart';
part 'getBiller_inputfields_model.g.dart';

@JsonSerializable()
class getBiller_inputfields_model{
  getBiller_inputfields_model({
    this.billerId

  });

  @JsonKey(name:'billerId')
  String? billerId;

  factory getBiller_inputfields_model.fromJson(Map<String, dynamic> json) =>
      _$getBiller_inputfields_modelFromJson(json);

  Map<String, dynamic> toJson() => _$getBiller_inputfields_modelToJson(this);

}

@JsonSerializable()
class HealthinputfieldsResponseModel{
  HealthinputfieldsResponseModel({
    this.status,
    this.msg,
    this.billers
  });

  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'msg')
  String? msg;

  @JsonKey(name:'billers')
  List<BillersList>? billers;

  factory HealthinputfieldsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HealthinputfieldsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HealthinputfieldsResponseModelToJson(this);

}

@JsonSerializable()
class BillersList {
  BillersList({
    this.id,
    this.paramName,
    this.dataType,
    this.billerId,
    this.minLength,
  });

  @JsonKey(name:'id')
  String? id;

  @JsonKey(name:'billerId')
  String? billerId;

  @JsonKey(name:'paramName')
  String? paramName;

  @JsonKey(name:'dataType')
  String? dataType;

  @JsonKey(name:'minLength')
  String? minLength;

  @JsonKey(name:'maxLength')
  String? maxLength;

  factory BillersList.fromJson(Map<String, dynamic> json) =>
      _$BillersListFromJson(json);

  Map<String, dynamic> toJson() => _$BillersListToJson(this);



}