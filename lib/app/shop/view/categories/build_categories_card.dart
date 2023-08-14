import 'package:flutter/material.dart';
import 'package:flutter_shop/component/common_button.dart';

class BuildCategoriesCard extends StatelessWidget {
  final String icon;
  const BuildCategoriesCard({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CommonButton(
        radius: 5,
        color: Colors.black.withAlpha(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(icon),
        ),
        onTap: () {},
      );
}
