import 'package:json_annotation/json_annotation.dart';

part 'post_complain.g.dart';

@JsonSerializable()
class PostComplain {
  @JsonKey(name: "type")
  final String? type;

  @JsonKey(name: "aParam")
  final String? aParam;

  @JsonKey(name: "msg")
  final String? msg;

  @JsonKey(name: "utransid")
  final String? utransid;

  // Response fields (optional, because the API will return them)
  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "complain_id")
  String? complainId;

  @JsonKey(name: "TransactionID")
  String? transactionID;

  @JsonKey(name: "UtransactionID")
  bool? utransactionID;

  @JsonKey(name: "OperatorID")
  String? operatorID;

  @JsonKey(name: "Number")
  String? number;

  @JsonKey(name: "Amount")
  String? amount;

  @JsonKey(name: "Status")
  String? complaintStatus;

  @JsonKey(name: "ResposneMessage")
  String? responseMessage;

  @JsonKey(name: "MarginPercentage")
  String? marginPercentage;

  @JsonKey(name: "MarginAmount")
  String? marginAmount;

  @JsonKey(name: "ErrorCode")
  int? errorCode;

  PostComplain({
    this.type,
    this.aParam,
    this.msg,
    this.utransid,
    this.status,
    this.complainId,
    this.transactionID,
    this.utransactionID,
    this.operatorID,
    this.number,
    this.amount,
    this.complaintStatus,
    this.responseMessage,
    this.marginPercentage,
    this.marginAmount,
    this.errorCode,
  });

  factory PostComplain.fromJson(Map<String, dynamic> json) =>
      _$PostComplainFromJson(json);

  Map<String, dynamic> toJson() => _$PostComplainToJson(this);
}
