import 'package:flutter/material.dart';
import 'package:flutter_shop/app/shop/view/shop_view.dart';
import 'package:flutter_shop/component/common_button.dart';
import 'package:flutter_shop/component/common_headings.dart';
import 'package:flutter_shop/component/dialog/common_remove_product_dialog.dart';
import 'package:flutter_shop/component/dialog/common_success_dialog.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import 'build_billing_headings.dart';
import 'build_item_card.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);

  final CartController getCart = Get.find<CartController>();

  void _toDo(BuildContext context) {
    getCart.putData();
    // navigate back to first page (shop view)
    Get.offAll(const ShopView());
    // reset cart
    getCart.resetCart();
    // show dialog
    CommonSuccessDialog.showModalDialog(
      context,
      okButton: () => Get.back(),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: getCart.cartItems.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [CommonHeadings(title: "Let's start shopping! Cart is empty.")],
                          ),
                        )
                      : CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: getCart.cartItems.length,
                                (_, i) => BuildItemCard(
                                  product: getCart.cartItems[i],
                                  onAdd: () {
                                    getCart.addProduct(getCart.cartItems[i]);
                                  },
                                  onRemove: () {
                                    if (getCart.cartItems[i].quantity > 1) {
                                      getCart.reduceProduct(getCart.cartItems[i]);
                                    } else {
                                      CommonRemoveProductDialog.showModalDialog(
                                        context,
                                        onRemove: () {
                                          // call the controller to reduce product qty or remove product
                                          getCart.reduceProduct(getCart.cartItems[i]);
                                          Get.back();
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      getCart.cartItems.isEmpty
                          ? const SizedBox.shrink()
                          : Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(20),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonHeadings(
                                    title: 'Billing Information',
                                    style: CommonHeadings.styleOpenSans.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  BuildBillingHeadings(
                                    title: 'Order Total',
                                    value: '\$ ${getCart.totalPrice.toStringAsFixed(2)}',
                                  ),
                                  BuildBillingHeadings(
                                    title: 'Tax',
                                    value: '\$ ${getCart.totalTax.toStringAsFixed(2)}',
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      for (int i = 0; i < 9; i++)
                                        Container(
                                          width: 10,
                                          height: 3,
                                          margin: const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  BuildBillingHeadings(
                                    title: 'Grand Total',
                                    value: '\$ ${getCart.grandTotal.toStringAsFixed(2)}',
                                  ),
                                ],
                              ),
                            ),
                      getCart.cartItems.isEmpty ? const SizedBox.shrink() : const SizedBox(height: 20),
                      CommonButton(
                        radius: 5,
                        child: const Center(
                          child: Text('Checkout'),
                        ),
                        onTap: () => _toDo(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
