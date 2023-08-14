import 'package:flutter/material.dart';
import 'package:flutter_shop/component/common_button.dart';
import 'package:flutter_shop/component/common_headings.dart';

class BuildProductHeader extends StatelessWidget {
  final String title;
  final String price;
  final String rating;
  const BuildProductHeader({
    Key? key,
    required this.title,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: CommonHeadings(
                      title: title,
                      style: CommonHeadings.styleOpenSans.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                SizedBox(
                  height: 25,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: CommonHeadings(
                      title: price,
                      style: CommonHeadings.styleOpenSans.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: CommonButton(
              radius: 5,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star_border),
                  const SizedBox(width: 5),
                  CommonHeadings(
                    title: rating,
                    style: CommonHeadings.styleRoboto.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
        ],
      );
}
