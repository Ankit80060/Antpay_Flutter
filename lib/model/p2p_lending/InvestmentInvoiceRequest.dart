class InvestmentInvoiceRequest {
  final String amount;
  final String mobile;
  final String partnerId;
  final String schemeId;
  final String aParam;

  InvestmentInvoiceRequest({
    required this.amount,
    required this.mobile,
    required this.partnerId,
    required this.schemeId,
    required this.aParam,
  });

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'mobile': mobile,
    'partner_id': partnerId,
    'scheme_id': schemeId,
    'aParam': aParam,
  };
}
