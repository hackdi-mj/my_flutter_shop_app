import 'package:flutter/material.dart';
import 'package:flutter_shop/component/common_headings.dart';
import 'package:get/get.dart';
import '../controller/product_controller.dart';

class BuildProductDetail extends StatelessWidget {
  final String productDetail;
  BuildProductDetail({
    Key? key,
    required this.productDetail,
  }) : super(key: key);

  final ProductController product = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeadings(
            title: productDetail,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 25),
          CommonHeadings(
            title: 'Size',
            style: CommonHeadings.styleOpenSans.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => Row(
              children: product.sizes
                  .asMap()
                  .entries
                  .map((size) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () => product.sizeSelected(size.key),
                          borderRadius: BorderRadius.circular(60),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: product.sizeValues[size.key] ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${size.value}'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: product.sizeValues[size.key] ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      );
}
