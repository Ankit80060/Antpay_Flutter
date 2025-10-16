import 'package:json_annotation/json_annotation.dart';

part 'recharge_status_check.g.dart';

@JsonSerializable()
class RechargeStatusRes {
  @JsonKey(name: "TransactionID")
  final String? transactionID;

  @JsonKey(name: "UtransactionID")
  final String? utransactionID;

  @JsonKey(name: "OperatorID")
  final String? operatorID;

  @JsonKey(name: "Number")
  final String? number;

  @JsonKey(name: "Amount")
  final String? amount;

  @JsonKey(name: "Status")
  @StringOrIntToIntConverter()
  final int? status;

  @JsonKey(name: "ResposneMessage")
  final String? responseMessage;

  @JsonKey(name: "MarginPercentage")
  final String? marginPercentage;

  @JsonKey(name: "MarginAmount")
  final String? marginAmount;

  @JsonKey(name:"complain_id")
  final String? complain_id;

  RechargeStatusRes({
    this.complain_id,
    this.transactionID,
    this.utransactionID,
    this.operatorID,
    this.number,
    this.amount,
    this.status,
    this.responseMessage,
    this.marginPercentage,
    this.marginAmount,
  });

  // **Factory method for JSON deserialization**
  factory RechargeStatusRes.fromJson(Map<String, dynamic> json) => _$RechargeStatusResFromJson(json);

  // **Method for JSON serialization**
  Map<String, dynamic> toJson() => _$RechargeStatusResToJson(this);
}

class StringOrIntToIntConverter implements JsonConverter<int?, dynamic> {
  const StringOrIntToIntConverter();

  @override
  int? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is int) return json;
    if (json is String) return int.tryParse(json);
    return null;
  }

  @override
  dynamic toJson(int? object) => object;
}


// request Model
@JsonSerializable()
class RechargeStatusReq{
  RechargeStatusReq({
    // this.mobile,
    this.aParam,
    this.utransactionid
});

  // @JsonKey(name:'mobile')
  // String? mobile;

  @JsonKey(name:'aParam')
  String? aParam;
   @JsonKey(name:'utransactionid')
  String? utransactionid;

  factory RechargeStatusReq.fromJson(Map<String, dynamic> json) =>
      _$RechargeStatusReqFromJson(json);

  Map<String, dynamic> toJson() => _$RechargeStatusReqToJson(this);


}
