import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_headings.dart';

abstract class CommonRemoveProductDialog extends StatelessWidget {
  const CommonRemoveProductDialog({
    Key? key,
  }) : super(key: key);

  static Future showModalDialog<T>(
    BuildContext context, {
    required void Function()? onRemove,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: CommonHeadings(
              title: 'Remove Product',
              style: CommonHeadings.styleOpenSans.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const CommonHeadings(
              title: 'Are you sure you want to remove this product from the cart?',
              overflow: TextOverflow.visible,
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const CommonHeadings(
                  title: 'Cancel',
                  overflow: TextOverflow.visible,
                ),
              ),
              TextButton(
                onPressed: onRemove,
                child: const CommonHeadings(
                  title: 'Remove',
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          );
        },
      );
}
