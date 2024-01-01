// full_image_screen.dart
import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  final String imagePath;

  FullImageScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Image'),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
