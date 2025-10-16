class InvestmentInvoiceResponse {
  final int? status;
  final InvoiceData? data;

  InvestmentInvoiceResponse({this.status, this.data});

  factory InvestmentInvoiceResponse.fromJson(Map<String, dynamic> json) {
    return InvestmentInvoiceResponse(
      status: json['status'],
      data: json['data'] != null ? InvoiceData.fromJson(json['data']) : null,
    );
  }
}

class InvoiceData {
  final String? amount;
  final int? lenderProcessingFee;
  final int? lenderPlatformFee;
  final int? lenderManagementFee;
  final int? totalAmount;
  final String? schemeId;
  final GenerateOrderResp? generateOrderResp;

  InvoiceData({
    this.amount,
    this.lenderProcessingFee,
    this.lenderPlatformFee,
    this.lenderManagementFee,
    this.totalAmount,
    this.schemeId,
    this.generateOrderResp,
  });

  factory InvoiceData.fromJson(Map<String, dynamic> json) {
    return InvoiceData(
      amount: json['amount'],
      lenderProcessingFee: json['lender_processing_fee'],
      lenderPlatformFee: json['lender_platform_fee'],
      lenderManagementFee: json['lender_management_fee'],
      totalAmount: json['total_amount'],
      schemeId: json['scheme_id'],
      generateOrderResp: json['generateOrderResp'] != null
          ? GenerateOrderResp.fromJson(json['generateOrderResp'])
          : null,
    );
  }
}

class GenerateOrderResp {
  final String? status;
  final String? antTxnId;
  final int? fee;
  final int? amount;
  final int? finalAmount;
  final String? orderId;
  final String? apiKey;
  final String? pgType;
  final String? channel;
  final String? msg;

  GenerateOrderResp({
    this.status,
    this.antTxnId,
    this.fee,
    this.amount,
    this.finalAmount,
    this.orderId,
    this.apiKey,
    this.pgType,
    this.channel,
    this.msg,
  });

  factory GenerateOrderResp.fromJson(Map<String, dynamic> json) {
    return GenerateOrderResp(
      status: json['status'],
      antTxnId: json['ant_txn_id'],
      fee: json['fee'],
      amount: json['amount'],
      finalAmount: json['final_amount'],
      orderId: json['order_id'],
      apiKey: json['api_key'],
      pgType: json['pg_type'],
      channel: json['channel'],
      msg: json['msg'],
    );
  }
}
