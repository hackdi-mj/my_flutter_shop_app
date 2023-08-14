import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonHeadings extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const CommonHeadings({
    Key? key,
    this.style,
    this.textAlign,
    this.overflow,
    required this.title,
  }) : super(key: key);

  static TextStyle styleRoboto = GoogleFonts.roboto(color: Colors.black);
  static TextStyle styleOpenSans = GoogleFonts.openSans(color: Colors.black);

  @override
  Widget build(BuildContext context) => Text(
        title,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: style ?? styleRoboto,
      );
}
