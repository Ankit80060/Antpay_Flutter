
import 'package:json_annotation/json_annotation.dart';

part 'fetchplan_list_model.g.dart';

@JsonSerializable()
class fetchplan_list_model{
  fetchplan_list_model({
    this.dataplan,
    this.aParam
  });

  @JsonKey(name: 'aParam')
  String? aParam;

  @JsonKey(name: 'data')
  Dataplan? dataplan;

  factory fetchplan_list_model.fromJson(Map<String, dynamic> json) =>
      _$fetchplan_list_modelFromJson(json);

  Map<String, dynamic> toJson() => _$fetchplan_list_modelToJson(this);
}

@JsonSerializable()
class Dataplan{
  Dataplan({
    this.datalist,
    this.data3g4g,
    this.Romaing,
    this.COMBO,
});

  @JsonKey(name: 'TOPUP')
  List<Datalist>? datalist;


  @JsonKey(name: '3G/4G')
  List<Datalist>? data3g4g;

  @JsonKey(name: 'FULLTT')
  List<Datalist>? fullTT;

  @JsonKey(name: 'Romaing')
  List<Datalist>? Romaing;

  @JsonKey(name: 'COMBO')
  List<Datalist>? COMBO;


  factory Dataplan.fromJson(Map<String, dynamic> json) =>
      _$DataplanFromJson(json);

  Map<String, dynamic> toJson() => _$DataplanToJson(this);

}

@JsonSerializable()
class Datalist {
  Datalist({
    this.rs,
    this.desc,
    this.status,
    this.validity,
    this.last_update,

  });

  @JsonKey(name: 'rs')
  String? rs;

  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'validity')
  String? validity;

  @JsonKey(name: 'last_update')
  String? last_update;

  @JsonKey(name: 'status')
  dynamic status;


  factory Datalist.fromJson(Map<String, dynamic> json) =>
      _$DatalistFromJson(json);

  Map<String, dynamic> toJson() => _$DatalistToJson(this);

}


//verify otp POST body class
@JsonSerializable()
class fetchPlanRequestModel{

  fetchPlanRequestModel({
    this.circle,
    this.operator,
    this.type,
    this.aParam

  });
  @JsonKey(name:"aParam")
  String? aParam;

  @JsonKey(name: 'circle')
  String? circle;

  @JsonKey(name: 'operator')
  String? operator;

  @JsonKey(name: 'type')
  String? type;


  factory fetchPlanRequestModel.fromJson(Map<String, dynamic> json) =>
      _$fetchPlanRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$fetchPlanRequestModelToJson(this);


}
