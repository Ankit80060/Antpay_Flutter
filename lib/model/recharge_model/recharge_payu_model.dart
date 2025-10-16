import 'package:json_annotation/json_annotation.dart';

part 'recharge_payu_model.g.dart';

@JsonSerializable()
class RechargePayUPaymentReq {
  @JsonKey(name: "ant_txn_id")
  final String? antTxnId;

  @JsonKey(name: "circlecode")
  final String? circlecode;

  @JsonKey(name: "operatorcode")
  final String? operatorcode;

  @JsonKey(name: "amount")
  final String? amount;

  // @JsonKey(name: "orderNo")
  // final String? orderNo;

  // @JsonKey(name: "statusCode")
  // final String? statusCode;

// @JsonKey(name: "txnAmount")
//   final String? txnAmount;

  @JsonKey(name: "aParam")
  final String? aParam;

  // @JsonKey(name: "statusDesc")
  // final String? statusDesc;

  @JsonKey(name: "number")
  final String? number;

  @JsonKey(name: "customermobile")
  final String? customermobile;

  @JsonKey(name: "payment_method")
  final String? paymentMethod;

  @JsonKey(name: "payu_response")
  final String? payuResponse;

  final int? transactionResult;

  @JsonKey(name: "transaction_type")
  final String? transactionType;

  @JsonKey(name: "service_type")
  final String? servicetype;

  RechargePayUPaymentReq({
    this.servicetype,
    // this.orderNo,
    // this.statusCode,
    // this.txnAmount,
    // this.statusDesc,
    this.antTxnId,
    this.aParam,
    this.circlecode,
    this.operatorcode,
    this.amount,
    this.number,
    this.customermobile,
    this.paymentMethod,
    this.payuResponse,
    this.transactionResult,
    this.transactionType,
  });

  // **Factory method for JSON deserialization**
  factory RechargePayUPaymentReq.fromJson(Map<String, dynamic> json) => _$RechargePayUPaymentReqFromJson(json);

  // **Method for JSON serialization**
  Map<String, dynamic> toJson() => _$RechargePayUPaymentReqToJson(this);


}


@JsonSerializable()
class RechargePayUPaymentRes {
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

  RechargePayUPaymentRes({
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
  factory RechargePayUPaymentRes.fromJson(Map<String, dynamic> json) => _$RechargePayUPaymentResFromJson(json);

  // **Method for JSON serialization**
  Map<String, dynamic> toJson() => _$RechargePayUPaymentResToJson(this);
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

