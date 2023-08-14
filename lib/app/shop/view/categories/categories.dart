import 'package:flutter/material.dart';
import 'build_categories_card.dart';

class BuildCategories extends StatefulWidget {
  const BuildCategories({Key? key}) : super(key: key);

  @override
  State<BuildCategories> createState() => _BuildCategoriesState();
}

class _BuildCategoriesState extends State<BuildCategories> {
  final List _icon = [
    'assets/shirt.png',
    'assets/dress.png',
    'assets/headphones.png',
    'assets/wristwatch.png',
    'assets/phone.png',
    'assets/laptop.png',
  ];

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _icon.length,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: BuildCategoriesCard(
                  icon: _icon[i],
                ),
              ),
            ),
          ),
        ),
      );
}
