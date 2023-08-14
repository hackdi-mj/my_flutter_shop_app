import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../model/model_product_cart.dart';
import '../../services/shop_services.dart';

class CartController extends GetxController {
  final Logger _log = Logger();
  final ShopServices _services = ShopServices();

  RxList<ProductCart> cartItems = <ProductCart>[].obs;

  RxDouble totalPrice = 0.0.obs;
  RxDouble totalTax = 0.0.obs;
  RxDouble grandTotal = 0.0.obs;

  void addToCart(ProductCart product) {
    // will contain items whose ID matches the product ID
    var contain = cartItems.where((item) => item.id == product.id);
    if (contain.isEmpty) {
      // add new product to cart
      cartItems.add(product);
    } else {
      // add qty of the product to cart
      final index = cartItems.indexWhere((element) => element.id == product.id);
      cartItems[index].quantity++;
      _log.i(index);
    }
    _log.i(cartItems.map((element) => element.id));
    // calculate total price
    _calculate();
  }

  void resetCart() {
    // call to reset the cart
    cartItems.clear();
    cartItems.refresh();
  }

  void _calculate() {
    // calculate and update a value of total price, tax, and grand total
    totalPrice.update((val) {
      totalPrice.value = _totalPrice;
    });
    totalTax.update((val) {
      totalTax.value = _totalTax;
    });
    grandTotal.update((val) {
      grandTotal.value = _totalPrice + _totalTax;
    });
  }

  double get _totalPrice {
    // will return the total price of all products in numeric format
    return cartItems.fold(0, (total, product) => total + (product.price * product.quantity));
  }

  double get _totalTax {
    return totalPrice * 0.1; // 10% tax
  }

  void addProduct(ProductCart product) {
    // to add product qty and calculate a total price after add qty
    product.quantity++;
    _calculate();
    cartItems.refresh();
  }

  void reduceProduct(ProductCart product) {
    // check qty of product
    if (product.quantity > 1) {
      // reduce qty (-1) if current qty is more than 1
      product.quantity--;
    } else {
      // to remove product if current product qty is only 1
      removeProduct(product);
    }
    _calculate();
    cartItems.refresh();
  }

  void removeProduct(ProductCart product) {
    // to remove product
    cartItems.remove(product);
    cartItems.refresh();
    // calculate after remove the product
    _calculate();
  }

  void putData() async {
    List<Map<String, dynamic>> cartItemsMap = cartItems.map((product) {
      String formattedAmount = product.price.toStringAsFixed(0); // convert and remove decimal
      return {
        'detail1': product.id,
        'detail2': product.quantity,
        'detail3': formattedAmount,
        'detail4': '',
        // properties
      };
    }).toList();

    _log.i(cartItemsMap);
    final response = await _services.putDataSales(product: jsonEncode(cartItemsMap));

    if (response.statusCode == HttpStatus.ok) {
      _log.i('Put Data : ${response.body}');
      // check sales list make sure put data is completely success
      _getSalesList();
    } else {
      _log.e('Put Data : ${response.body}');
    }
  }

  _getSalesList() async {
    // get datetime
    final today = DateTime.now();
    final nextDay = today.add(const Duration(days: 14));
    final formattedToday = '${today.year}-${today.month}-${today.day}';
    final formattedNextDay = '${nextDay.year}-${nextDay.month}-${nextDay.day}';
    // try to call sales list api
    final response = await _services.getDataSalesList(formattedToday, formattedNextDay);
    _log.w(response.body['data']);
  }
}
