import 'package:flutter/material.dart';

class AppItemRounded extends StatelessWidget {
  final String imagePath;
  final double borderRadius;

  AppItemRounded({
    required this.imagePath,
    this.borderRadius = 15.0, // Default border radius if not specified
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(imagePath),
    );
  }
}
