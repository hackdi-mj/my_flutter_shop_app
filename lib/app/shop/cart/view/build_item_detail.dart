import 'package:flutter/material.dart';
import 'package:flutter_shop/component/common_headings.dart';

class BuildItemDetail extends StatelessWidget {
  final String title;
  final String? value;
  final Widget? child;
  const BuildItemDetail({
    Key? key,
    this.child,
    this.value,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonHeadings(
            title: title,
            style: CommonHeadings.styleRoboto.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          value != null
              ? CommonHeadings(
                  title: value!,
                  style: CommonHeadings.styleRoboto.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                )
              : child!,
        ],
      );
}
