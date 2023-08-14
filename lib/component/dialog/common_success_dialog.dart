import 'package:flutter/material.dart';
import '../common_headings.dart';

abstract class CommonSuccessDialog extends StatelessWidget {
  const CommonSuccessDialog({
    Key? key,
  }) : super(key: key);

  static Future showModalDialog<T>(
    BuildContext context, {
    required void Function()? okButton,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: CommonHeadings(
              title: 'Success',
              style: CommonHeadings.styleOpenSans.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const CommonHeadings(
              title: 'Your order has been successfully placed.',
              overflow: TextOverflow.visible,
            ),
            actions: [
              TextButton(
                onPressed: okButton,
                child: const CommonHeadings(
                  title: 'Ok',
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          );
        },
      );
}
