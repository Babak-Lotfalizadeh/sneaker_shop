import 'package:flutter/material.dart';

class SearchFilterItem extends StatelessWidget {
  final String title;
  final bool selected;
  final Function() onClick;

  const SearchFilterItem({
    required this.title,
    required this.onClick,
    this.selected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: selected ? null : onClick,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: selected ? null : Colors.black38,
                ),
          ),
        ),
      ),
    );
  }
}
