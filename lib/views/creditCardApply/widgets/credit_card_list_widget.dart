import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_widget/image_widget.dart';
import '../../../model/creditCard/credit_card_model.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditCardModel card;

  const CreditCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageWithLoader(
              url: card.cardImg ?? "",
              height: 100,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10),
            Text(card.creditCardName ?? "",
                style:
                    CustomStyles.black14400.copyWith(fontSize: 13)),
            const SizedBox(height: 5),
            Text(
              "Annual Fee: ${card.annualFee}",
              style: CustomStyles.black12300.copyWith(fontSize: 11),
            ),
            Text("Joining Fee: ${card.joiningFee}",
                style: CustomStyles.black12300.copyWith(fontSize: 11)),
            Spacer(),
            CustomElevatedButton(
              onPressed: () {
                Get.toNamed(RoutesName.crediCradDetailsView,arguments: {"creditCardId":card.id}  );
              },
              text: "Apply Now",
            ),
          ],
        ),
      ),
    );
  }
}
