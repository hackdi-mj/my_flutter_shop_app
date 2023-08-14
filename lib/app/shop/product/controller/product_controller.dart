import 'dart:convert';
import 'package:flutter_shop/app/shop/product/model/model_product.dart';
import 'package:flutter_shop/app/shop/services/shop_services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ProductController extends GetxController {
  final Logger _log = Logger();
  final ShopServices _services = ShopServices();

  RxList<Product> product = <Product>[].obs;
  final List sizes = ['s', 'm', 'l', 'xl'];

  RxList<bool> sizeValues = <bool>[true, false, false, false, false].obs;

  sizeSelected(int index) {
    // only one value changes to true, and another to false, according to the selected index.
    for (var i = 0; i < sizeValues.length; i++) {
      sizeValues[i] = i == index ? !sizeValues[i] : false;
    }
    sizeValues.refresh();
  }

  void loadProductList() async {
    try {
      // try to fetch data
      final data = await _fetchProductList();
      if (data.isNotEmpty) {
        product.assignAll(data);
      }
    } catch (e) {
      _log.e(e);
    }
  }

  Future<List<Product>> _fetchProductList() async {
    List<Product> product = List.empty();
    final response = await _services.getDataProduct();
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body['data']);
      final List<dynamic> get = data['Table'];
      product = get.map((item) => Product.fromJson(item)).toList();
      _log.i(product[0]);
    } else {
      _log.e(response.body['data']);
      throw Exception('Failed to fetch Product');
    }

    return product;
  }
}
