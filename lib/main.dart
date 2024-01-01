import 'package:dbsedcampus/pages/SplashScreen.dart';
import 'package:flutter/material.dart';

Future <void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:SplashScreen() ,);
  }
}