import 'package:flutter/material.dart';
import '../component/common_headings.dart';

class CommonPageView extends StatelessWidget {
  final Color color;
  final String title;
  const CommonPageView({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: Center(
          child: CommonHeadings(
            title: title,
            style: CommonHeadings.styleOpenSans.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
}
