import 'package:flutter/material.dart';
import 'package:flutter_shop/component/common_button.dart';
import 'package:flutter_shop/component/common_headings.dart';
import '../model/model_product_cart.dart';
import 'build_item_detail.dart';

class BuildItemCard extends StatelessWidget {
  final ProductCart product;
  final void Function() onAdd;
  final void Function() onRemove;

  const BuildItemCard({
    Key? key,
    required this.product,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(20),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(product.picture),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 19,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: CommonHeadings(
                              title: product.name,
                              style: CommonHeadings.styleRoboto.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: CommonHeadings(
                              title: product.price.toString(),
                              style: CommonHeadings.styleRoboto.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            BuildItemDetail(
                              title: 'Size : ',
                              value: product.size,
                            ),
                            const SizedBox(width: 10),
                            BuildItemDetail(
                              title: 'Color : ',
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonButton(
                          radius: 5,
                          width: 25,
                          height: 25,
                          color: Colors.black,
                          onTap: onAdd,
                          child: const Center(
                            child: Icon(Icons.add, size: 20),
                          ),
                        ),
                        CommonHeadings(title: product.quantity.toString()),
                        CommonButton(
                          radius: 5,
                          width: 25,
                          height: 25,
                          color: Colors.transparent,
                          border: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(color: Colors.black),
                          ),
                          onTap: onRemove,
                          child: const Center(
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
