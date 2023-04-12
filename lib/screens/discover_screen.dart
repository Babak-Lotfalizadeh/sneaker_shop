import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/providers/discover_provider.dart';
import 'package:sneaker_shop/widgets/bottom_navigation_bar_widget.dart';
import 'package:sneaker_shop/widgets/discover_content_widget.dart';
import 'package:sneaker_shop/widgets/search_app_bar_widget.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBarWidget(title: "Discover"),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => DiscoverProvider()..init(),
        builder: (context, child) => const DiscoverContentWidget(),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
