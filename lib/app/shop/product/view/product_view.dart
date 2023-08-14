import 'package:flutter/material.dart';
import 'package:flutter_shop/app/shop/cart/controller/cart_controller.dart';
import 'package:flutter_shop/app/shop/cart/model/model_product_cart.dart';
import 'package:flutter_shop/app/shop/cart/view/cart_view.dart';
import 'package:flutter_shop/component/common_button.dart';
import 'package:flutter_shop/component/common_headings.dart';
import 'package:get/get.dart';
import '../model/model_product.dart';
import 'build_product_detail.dart';
import 'build_product_header.dart';

class ProductView extends StatelessWidget {
  final Product product;
  ProductView({
    Key? key,
    required this.product,
  }) : super(key: key);

  final CartController getCart = Get.put(CartController());

  void _toDo(BuildContext context) {
    // convert product value to double
    double price = double.parse(product.productValue!);
    // setup product class
    ProductCart productCart = ProductCart(
      id: product.productId!,
      picture: product.productPhoto!,
      name: product.productName!,
      price: price,
      quantity: 1,
      size: 'L',
    );
    // add product to the list of product
    getCart.addToCart(productCart);
    // navigate to the next screen
    Get.to(CartView());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    pinned: true,
                    title: const CommonHeadings(title: 'Cooper Mount Bike'),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Image.network(product.productPhoto!),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildProductHeader(
                            title: product.productName!,
                            price: '\$ ${product.productValue!}',
                            rating: '4.5',
                          ),
                          const SizedBox(height: 50),
                          BuildProductDetail(
                              productDetail:
                                  " is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CommonButton(
                    radius: 5,
                    color: Colors.black.withAlpha(20),
                    child: const Center(
                      child: Icon(
                        Icons.local_mall_outlined,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CommonButton(
                      radius: 5,
                      child: const Center(
                        child: Text('Add to Cart'),
                      ),
                      onTap: () => _toDo(context),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
