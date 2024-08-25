import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  const ImageAsset({super.key, required this.url, this.width = 100});

  final String url;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      width: width,
    );
  }
}
