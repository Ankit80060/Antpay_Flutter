class PaymentProcessingRequest {
  String? mobile;
  String? antTxnId;
  String? investmentAmount;
  String? razorpayOrderId;
  String? razorpayPaymentId;
  String? razorpaySignature;
  String? totalAmount;
  String? schemeId;

  PaymentProcessingRequest({
    this.mobile,
    this.antTxnId,
    this.investmentAmount,
    this.razorpayOrderId,
    this.razorpayPaymentId,
    this.razorpaySignature,
    this.totalAmount,
    this.schemeId,
  });

  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'ant_txn_id': antTxnId,
      'investment_amount': investmentAmount,
      'razorpay_order_id': razorpayOrderId,
      'razorpay_payment_id': razorpayPaymentId,
      'razorpay_signature': razorpaySignature,
      'total_amount': totalAmount,
      'scheme_id': schemeId,
    };


  }

}
class PaymentProcessingResponse {
  final String? status;
  final String? msg;
  final String? txnId;
  final String? investmentId;
  final String? lenderId;

  PaymentProcessingResponse({
    this.status,
    this.msg,
    this.txnId,
    this.investmentId,
    this.lenderId,
  });

  factory PaymentProcessingResponse.fromJson(Map<String, dynamic> json) {
    return PaymentProcessingResponse(
      status: json['status'] as String?,
      msg: json['msg'] as String?,
      txnId: json['txn_id'] as String?,
      investmentId: json['investment_no'] as String?,
      lenderId: json['lender_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'msg': msg,
      'txn_id': txnId,
      'investment_no': investmentId,
      'lender_id': lenderId,
    };
  }
}
