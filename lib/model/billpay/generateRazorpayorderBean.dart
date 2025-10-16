import 'package:json_annotation/json_annotation.dart';
part 'generateRazorpayorderBean.g.dart';
//verify otp POST body class
@JsonSerializable()
class generateRazorpayorderModel {
  generateRazorpayorderModel({
    this.amount,
    this.mobile,
    this.service,
  });

  @JsonKey(name: 'amount')
  String? amount;

  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'service')
  String? service;




  factory generateRazorpayorderModel.fromJson(Map<String, dynamic> json) =>
      _$generateRazorpayorderModelFromJson(json);

  Map<String, dynamic> toJson() => _$generateRazorpayorderModelToJson(this);

}
@JsonSerializable()
class generateRazorpayorderBean {
  generateRazorpayorderBean({
    this.msg,
    this.order_id,
    this.api_key,
    this.ant_txn_id,
  });

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'order_id')
  String? order_id;


  @JsonKey(name: 'api_key')
  String? api_key;


  @JsonKey(name: 'ant_txn_id')
  String? ant_txn_id;




  factory generateRazorpayorderBean.fromJson(Map<String, dynamic> json) =>
      _$generateRazorpayorderBeanFromJson(json);

  Map<String, dynamic> toJson() => _$generateRazorpayorderBeanToJson(this);


}



