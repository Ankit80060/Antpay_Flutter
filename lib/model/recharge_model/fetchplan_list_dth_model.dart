
import 'package:json_annotation/json_annotation.dart';

part 'fetchplan_list_dth_model.g.dart';

@JsonSerializable()
class fetchplan_list_dth_model{
  fetchplan_list_dth_model({
    this.dataplan,

  });


  @JsonKey(name: 'data')
  datalistdth? dataplan;

  factory fetchplan_list_dth_model.fromJson(Map<String, dynamic> json) =>
      _$fetchplan_list_dth_modelFromJson(json);

  Map<String, dynamic> toJson() => _$fetchplan_list_dth_modelToJson(this);
}

@JsonSerializable()
class datalistdth{
  datalistdth({
    this.datalistdthaplan,
    
  });

  @JsonKey(name: 'Plan')
  List<Datalist>? datalistdthaplan;


  factory datalistdth.fromJson(Map<String, dynamic> json) =>
      _$datalistdthFromJson(json);

  Map<String, dynamic> toJson() => _$datalistdthToJson(this);

}

@JsonSerializable()
class Datalist {
  Datalist({
    this.rs,
    this.desc,
    this.status,
    this.plan_name,
    this.last_update,

  });

  @JsonKey(name: 'rs')
   Rs? rs;

  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'plan_name')
  String? plan_name;

  @JsonKey(name: 'last_update')
  String? last_update;

  @JsonKey(name: 'status')
  dynamic status;


  factory Datalist.fromJson(Map<String, dynamic> json) =>
      _$DatalistFromJson(json);

  Map<String, dynamic> toJson() => _$DatalistToJson(this);

}
@JsonSerializable()
class Rs {
  Rs({
    this.year1,
    this.months1,
    this.months6
});

  @JsonKey(name: '1 YEAR')
  String? year1;
  @JsonKey(name: '6 MONTHS')
  String? months6;

  @JsonKey(name: '1 MONTHS')
  String? months1;


  factory Rs.fromJson(Map<String, dynamic> json) =>
      _$RsFromJson(json);

  Map<String, dynamic> toJson() => _$RsToJson(this);
}


//verify otp POST body class
@JsonSerializable()
class fetchPlanRequestModeldth{

  fetchPlanRequestModeldth({
    this.circle,
    this.operator,
    this.type, 
    this.aParam

  });

  @JsonKey(name: 'circle')
  String? circle;

  @JsonKey(name: 'operator')
  String? operator;

  @JsonKey(name: 'type')
  String? type; 

  @JsonKey(name: 'aParam')
  String? aParam;

  factory fetchPlanRequestModeldth.fromJson(Map<String, dynamic> json) =>
      _$fetchPlanRequestModeldthFromJson(json);

  Map<String, dynamic> toJson() => _$fetchPlanRequestModeldthToJson(this);


}
