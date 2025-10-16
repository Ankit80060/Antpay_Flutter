import 'package:flutter/material.dart';

class MyImageTextWidget extends StatefulWidget {
  final String imagePath;
  final String imageText;
  final VoidCallback? onTap;

  const MyImageTextWidget({
    required this.imagePath,
    required this.imageText,
    this.onTap,
  });

  @override
  State<MyImageTextWidget> createState() => _MyImageTextWidgetState();
}

class _MyImageTextWidgetState extends State<MyImageTextWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(widget.imagePath),
              width: 35,
              height: 35,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.imageText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
