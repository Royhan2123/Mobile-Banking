import 'package:flutter/material.dart';
import 'package:mobile_ebanking/ui/pages/splash_page.dart';

void main() {
  runApp(const NewApp());
}
class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "",
      home: SplashPage(),
    );
  }
}
