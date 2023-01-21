import 'package:crypto_coin/Pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Coin Price Tracking',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashPage(),
    );
  }
}
