import 'package:flutter/material.dart';
import 'pricing.dart';
void main() {
runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Harga Layanan IT',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: const Center(
          child: PricingCard(),
        ),
      ),
    );
  }
}