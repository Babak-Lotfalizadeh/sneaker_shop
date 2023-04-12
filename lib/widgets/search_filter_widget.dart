import 'package:flutter/material.dart';
import 'package:sneaker_shop/utility/screen_value.dart';
import 'package:sneaker_shop/utility/utility.dart';
import 'package:sneaker_shop/widgets/search_filter_item.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ScreenValues.paddingLarge,
        ),
        child: Row(
          children: [
            SearchFilterItem(
              title: "New",
              onClick: () => Utility.dummyClick(context),
            ),
            SearchFilterItem(
              title: "Featured",
              onClick: () => Utility.dummyClick(context),
              selected: true,
            ),
            SearchFilterItem(
              title: "Upcoming",
              onClick: () => Utility.dummyClick(context),
            ),
          ],
        ),
      ),
    );
  }
}
