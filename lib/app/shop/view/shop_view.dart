import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../product/controller/product_controller.dart';
import 'banner/banner.dart';
import 'build_shop_headings.dart';
import 'categories/categories.dart';
import 'new_arrival/new_arrival.dart';

class ShopView extends StatefulWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  final ProductController getProduct = Get.put(ProductController());

  @override
  void initState() {
    getProduct.loadProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            const BuildBanner(),
            BuildShopHeadings(
              title: 'Top Categories',
              onPressed: () {},
            ),
            const BuildCategories(),
            BuildShopHeadings(
              title: 'New Arrivals',
              onPressed: () {},
            ),
            BuildNewArrivals(),
          ],
        ),
      );
}
