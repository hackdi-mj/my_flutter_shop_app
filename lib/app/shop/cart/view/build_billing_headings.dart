import 'package:flutter/material.dart';
import 'package:flutter_shop/component/common_headings.dart';

class BuildBillingHeadings extends StatelessWidget {
  final String title;
  final String value;
  const BuildBillingHeadings({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonHeadings(
            title: title,
            style: CommonHeadings.styleOpenSans.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          CommonHeadings(
            title: value,
            style: CommonHeadings.styleOpenSans.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
