import 'package:flutter/material.dart';
import 'package:flutter_shop/app/shop/product/model/model_product.dart';
import 'package:flutter_shop/app/shop/product/view/product_view.dart';
import 'package:flutter_shop/component/common_button.dart';
import 'package:flutter_shop/component/common_headings.dart';
import 'package:get/get.dart';

class BuildShopCard extends StatelessWidget {
  final Product product;
  const BuildShopCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: InkWell(
          onTap: () => Get.to(ProductView(product: product)),
          borderRadius: BorderRadius.circular(5),
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
                    child: Image.network(
                      product.productPhoto!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(),
                          CommonHeadings(
                            title: product.productName!,
                          ),
                          CommonHeadings(
                            title: '\$ ${product.productValue!}',
                            style: CommonHeadings.styleRoboto.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CommonButton(
                            radius: 5,
                            height: 40,
                            child: Row(
                              children: [
                                const Icon(Icons.star_border),
                                const SizedBox(width: 5),
                                CommonHeadings(
                                  title: '4.5',
                                  style: CommonHeadings.styleRoboto.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(60),
                              child: const SizedBox(
                                height: 40,
                                width: 40,
                                child: Icon(Icons.favorite),
                              ),
                            ),
                          ),
                          CommonButton(
                            width: 35,
                            height: 35,
                            radius: 5,
                            color: Colors.transparent,
                            border: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                color: Colors.black.withAlpha(40),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                            onTap: () => Get.to(ProductView(product: product)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
