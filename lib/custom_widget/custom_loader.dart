import 'package:flutter/material.dart';

class Customloader extends StatelessWidget {
  const Customloader({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
                child: Image(
                  image: const AssetImage('assets/images/loader_image.gif'),
                  width: 60,
                  height: 50
                  // controller: gifController,
                ),
              );
  }
}