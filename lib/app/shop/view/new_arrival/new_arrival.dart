import 'package:flutter/material.dart';
import 'package:flutter_shop/app/shop/product/controller/product_controller.dart';
import 'package:get/get.dart';
import 'build_shop_card.dart';

class BuildNewArrivals extends StatelessWidget {
  BuildNewArrivals({Key? key}) : super(key: key);
  final ProductController item = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) => Obx(
        () => SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: item.product.length,
            (_, i) => BuildShopCard(
              product: item.product[i],
            ),
          ),
        ),
      );
}
