import 'package:flutter/material.dart';
import 'package:flutter_shop/component/common_headings.dart';

class BuildShopHeadings extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const BuildShopHeadings({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonHeadings(
                title: title,
                style: CommonHeadings.styleOpenSans.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: onPressed,
                child: Row(
                  children: [
                    CommonHeadings(
                      title: 'View More',
                      style: CommonHeadings.styleRoboto.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.orangeAccent,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
