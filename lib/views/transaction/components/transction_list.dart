import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';

import '../../../model/antPayCard/transaction_history_response_model.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.tx,
    required this.isSuccess,
  });

  final StatementDetails tx;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tx.transactionNarration??"",
              style: CustomStyles.black13500,
            ),
            SizedBox(
              height: 4.0,
            )
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ref: ${tx.clientTxnId}",
              style: CustomStyles.grey123.copyWith(fontSize: 11.0),
            ),
            Text(tx.transactionDate ??'',
                style: CustomStyles.grey123.copyWith(fontSize: 11.0)),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Success", style: CustomStyles.black12600),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  true ? Icons.check_circle : Icons.cancel,
                  color: true ? Colors.green : Colors.red,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text("+${tx.transactionAmount}",
                    style: CustomStyles.black12400.copyWith(
                      color: true ? Colors.green : Colors.red,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
