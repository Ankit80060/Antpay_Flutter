import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';

class CurrentInvestmentListTile extends StatelessWidget {
  final String investementNumber;
  final String investementAmount;
  final String interestValue;
  final String investmentDate;
  final String interestRate;
  final VoidCallback? onTap;

  const CurrentInvestmentListTile({
    super.key,
    required this.investementNumber,
    required this.investementAmount,
    required this.interestValue,
    required this.investmentDate,
    required this.interestRate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
     
      child: InkWell(
        onTap: onTap,
        child: Container(
     
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                investementNumber,
                style: CustomStyles.black12600
              ),
              const SizedBox(height: 8),
             
              Row(
                children:  [
                  Text(
                    'Investment Amt',
                    style: CustomStyles.black12400,
                  ),
                  Spacer(),
                  Text(
                    'Interest value',
                 style: CustomStyles.black12400,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Rs ${investementAmount}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 14.0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    interestValue,
                style: CustomStyles.black12600,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children:  [
                  Text(
                    'Investment date',
                 style: CustomStyles.black12400,
                  ),
                  Spacer(),
                  Text(
                    'Interest Rate',
                  style: CustomStyles.black12400,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    investmentDate,
                   style: CustomStyles.black12600,
                  ),
                  const Spacer(),
                  Text(
                    interestRate,
                  style: CustomStyles.black12600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class PastInvestmentListTile extends StatelessWidget {
  final String investementNumber;
  final String investementAmount;
  final String investmentDate;
  final String redemptionDate;
   final VoidCallback? onTap;

  const PastInvestmentListTile({
    super.key,
    required this.investementNumber,
    required this.investementAmount,
    required this.investmentDate,
    required this.redemptionDate,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
   
      child: Container(
   
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                investementNumber,
              style: CustomStyles.black12600,
              ),
              const SizedBox(height: 12),
              Row(
                children:  [
                  Text(
                    'Investment Amt',
                  style: CustomStyles.black12400,
                  ),
                  Spacer(),
                  Text(
                    'Investment Date',
                   style: CustomStyles.black12400,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                   "Rs ${investementAmount}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 14.0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    investmentDate,
                 style: CustomStyles.black12600,
                  ),
                ],
              ),
              const SizedBox(height: 12),
               Text(
                'Redemption Date',
              style: CustomStyles.black12400,
              ),
              Text(
                redemptionDate,
               style: CustomStyles.black12600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class CustomSizeBox extends StatelessWidget {
  final double amount;
  final String text;
  final Color color;

  const CustomSizeBox({
    super.key,
    required this.color,
    required this.amount,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
       padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                amount.toStringAsFixed(2),
                textAlign: TextAlign.center,
               style: CustomStyles.white14500,
              ),
              const SizedBox(height: 4),
              Text(
                text,
                textAlign: TextAlign.center,
                style: CustomStyles.white10500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CustomSchemeListTile extends StatelessWidget {
  final String schemeName;
  final String minInvestment;
  final String maxInvestment;
  final String interestRate;
  final String description;
  final VoidCallback onTap;

  const CustomSchemeListTile({
    Key? key,
    required this.schemeName,
    required this.minInvestment,
    required this.maxInvestment,
    required this.interestRate,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF2FCFD),
     
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              schemeName,
              style:CustomStyles.black14600
            ),
            const SizedBox(height: 8),
             Text(
              'Min. Subscription Amount',
              style: CustomStyles.grey125
            ),
            Text(
              'INR $minInvestment',
              style:CustomStyles.black12600
            ),
            const SizedBox(height: 8),
             Text(
              'Max. Subscription Amount',
              style:CustomStyles.grey125
            ),
            Text(
              'INR $maxInvestment',
            style:CustomStyles.black12600
            
            ),
            const SizedBox(height: 8),
             Text(
              'Expected Return on Capital',
               style:CustomStyles.grey125
            ),
            Text(
              '$interestRate% P.A',
               style:CustomStyles.black12600
            ),
            const SizedBox(height: 8),
             Text(
              'Description',
              style:CustomStyles.grey125
            ),
            Text(
              description,
               style:CustomStyles.black12600
            ),
            const SizedBox(height: 16),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color(0xFFC5E6EB),
            //   ),
            //   onPressed: onTap,
            //   child: const Text('Lend Now'),
            // ),
            CustomElevatedButton(onPressed: onTap,text: "Lend Now",)
          ],
        ),
      ),
    );
  }
}
