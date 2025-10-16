import 'package:antpay_lite/views/miniAcc/controller/account_details_controller.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({
    super.key,
    required this.accountcontroller,
    required this.images,
    required this.texts,
    required this.type,
    required this.onItemTap, required  this.itemLength,
  });

  final AccountDetailsController accountcontroller;
  final List<String> images;
  final List<String> texts;
  final String type; 
  final int itemLength;
  final Function(int index, String type) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 7.0),
        child: SizedBox(
          height: 80, 
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: itemLength,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onItemTap(index, type),
                child: SizedBox(
                  width: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(type=="Service")
                        Image.asset(
                          images[index],
                          scale: 3.0,
                          height: 40,
                        )
                      else
                      Image.network(
                        images[index],
                        scale: 3.0,
                        height: 40,
                        errorBuilder: (ctx, error, stack) =>
                            const Icon(Icons.broken_image, size: 40),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        texts[index],
                        style: CustomStyles.grey103,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
