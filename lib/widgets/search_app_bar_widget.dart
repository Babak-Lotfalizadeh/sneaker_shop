import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sneaker_shop/utility/screen_value.dart';
import 'package:sneaker_shop/utility/utility.dart';
import 'package:sneaker_shop/widgets/app_bar_icon.dart';

class SearchAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const SearchAppBarWidget({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: kToolbarHeight * 1.5,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
      ),
      elevation: 0,
      actionsIconTheme: Theme.of(context).primaryIconTheme,
      actions: [
        AppBarIcon(
          Icons.search,
          onClick: () => Utility.dummyClick(context),
        ),
        AppBarIcon(
          Icons.notifications_none,
          onClick: () => Utility.dummyClick(context),
        ),
        const SizedBox(width: ScreenValues.paddingNormal),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}
