import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final void Function() onTap;
  final Color? color;
  final Widget child;
  final double? height;
  final double? width;
  final bool? circle;
  final double? radius;
  final double? elevation;
  final MaterialStateProperty<BorderSide?>? border;
  const CommonButton({
    Key? key,
    this.color,
    this.height,
    this.circle,
    this.elevation,
    this.width,
    this.radius,
    this.border,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height ?? 50,
        width: width,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(elevation ?? 0),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            shape: circle == true
                ? MaterialStateProperty.all<CircleBorder>(const CircleBorder())
                : MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius ?? 60),
                    ),
                  ),
            backgroundColor: MaterialStateProperty.all(
              color ?? Colors.orange,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            side: border,
          ),
          child: child,
        ),
      );
}
