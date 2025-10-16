import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:flutter/material.dart';

class NetworkImageWithLoader extends StatelessWidget {
  final String? url;
  final String? assetImage;
  final double height;
  final double width;
  final BoxFit fit;

  const NetworkImageWithLoader({
    super.key,
     this.url,
    this.assetImage,
    this.height = 200,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
      child: url !=null? Image.network(
        url!,
        fit: fit,
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? loadingProgress,
        ) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Container(
              height: height,
              color: Colors.grey[200], 
              child: const Center(
                child: Customloader(), 
              ),
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.broken_image, color: Colors.red),
            ),
          );
        },
      ) : Image.asset(
        assetImage!,
        fit: fit,
        height: height,
        width: width,
      ),
    );
  }
}
