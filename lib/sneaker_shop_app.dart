import 'package:flutter/material.dart';
import 'package:sneaker_shop/screens/discover_screen.dart';

class SneakerShopApp extends StatelessWidget {
  const SneakerShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: "josefin",
        primaryIconTheme: const IconThemeData().copyWith(
          color: Colors.black87,
        ),
      ),
      home: const DiscoverPage(),
    );
  }
}
