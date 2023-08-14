import 'package:flutter/material.dart';
import 'package:flutter_shop/component/common_headings.dart';

class CommonNavigationIconBar extends StatelessWidget {
  final IconData icon;
  final String? title;
  const CommonNavigationIconBar({
    Key? key,
    required this.icon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          title == null
              ? const SizedBox.shrink()
              : CommonHeadings(
                  title: title!,
                  style: CommonHeadings.styleRoboto.copyWith(
                    color: Colors.white,
                  ),
                )
        ],
      );
}
