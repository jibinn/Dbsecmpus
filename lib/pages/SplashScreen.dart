import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dbsedcampus/pages/HomeScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set a delay for the splash screen to be displayed
    Future.delayed(Duration(seconds: 3), () {
      // After the delay, navigate to the HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Container(
      color: Colors.white,
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'DbsECampus',
              textStyle: TextStyle(
                fontSize: 48,
                color: Color.fromARGB(255, 24, 0, 113),
              ),
              speed: Duration(milliseconds: 100),
            ),
          ],
        ),
      ),
    );
  }
}
