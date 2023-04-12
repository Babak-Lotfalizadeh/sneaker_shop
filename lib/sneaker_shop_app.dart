import 'package:flutter/material.dart';
import 'package:sneaker_shop/screens/discover_screen.dart';

class SneakerShopApp extends StatelessWidget {
  const SneakerShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DiscoverPage(),
    );
  }
}
