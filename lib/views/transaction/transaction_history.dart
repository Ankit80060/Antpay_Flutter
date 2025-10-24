import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/viewmodels/transaction/transaction_history_controller.dart';
import 'package:antpay_lite/views/transaction/transaction_history_failure_success_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionHistory extends StatelessWidget {
  TransactionHistory({Key? key}) : super(key: key);

  final controller = Get.put(TransactionHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: Customloader());
      }
      return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: controller.images.map((url) {
                  return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: url ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: Customloader(),
                          ),
                        ),
                      ));
                }).toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 7,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    controller.currentIndex.value = index;
                  },
                ),
              ),
              const SizedBox(height: 8),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.images.map((url) {
                      int index = controller.images.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentIndex.value == index
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  )),
              const SizedBox(height: 15),
              Text('Transaction History', style: CustomStyles.black14600),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.transactionList.isEmpty) {
                  return const Center(child: Text("No transactions found"));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.transactionList.length,
                  itemBuilder: (context, index) {
                    final txn = controller.transactionList[index];
                    print("txn${txn.transaction_no}");
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => TransactionFailureSuccessScreen(),
                          arguments: {
                            "transactionNo": txn.transaction_no,
                            "isSuccess": txn.status == "success",
                          },
                        );
                      },
                      child: Card(
                        elevation: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                ),
                              ]),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${txn.transaction_type} to ${txn.app_user_mobile}" ??
                                      "No ID",
                                  style: CustomStyles.black13500,
                                ),
                                const SizedBox(height: 2.0),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  txn.payment_method ?? "",
                                  style: CustomStyles.grey123
                                      .copyWith(fontSize: 11.0),
                                ),
                                Text(
                                  "Ref: ${txn.transaction_no ?? '-'}",
                                  style: CustomStyles.grey123
                                      .copyWith(fontSize: 11.0),
                                ),
                              ],
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  txn.status!.toUpperCase() ?? "Pending",
                                  style: CustomStyles.black12600,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      txn.status == "success"
                                          ? Icons.add_circle
                                          : Icons.remove_circle,
                                      color: txn.status == "success"
                                          ? Colors.green
                                          : Colors.red,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "₹${txn.amount}" ?? "0",
                                      style: CustomStyles.black13500
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      );
    }));
  }
}
