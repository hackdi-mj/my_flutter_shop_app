import 'dart:math';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BannerController extends GetxController {
  // static image list
  final List image = [
    'https://cdn.pixabay.com/photo/2018/12/09/11/24/sale-3864704_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/10/03/19/10/sale-1712547_1280.png',
    'https://cdn.pixabay.com/photo/2016/12/03/01/35/black-friday-1878945_1280.png',
    'https://cdn.pixabay.com/photo/2017/11/29/13/28/a-discount-2986181_1280.jpg',
  ];

  RxList<bool> boolValues = <bool>[].obs;
  List<bool> imageSelected() {
    /* 
     is used to generate a random value that will indicate the position (index) 
     in the boolValues list where a true value will be placed.
    */
    int trueIndex = Random().nextInt(image.length);
    // to generate random list of bool value
    boolValues = List.generate(image.length, (index) => index == trueIndex).obs;
    boolValues.refresh();
    Logger().i(boolValues);
    return boolValues;
  }
}
