import 'package:flutter_shop/app_services/constant.dart';
import 'package:get/get.dart';

class ShopServices extends GetConnect {
  // Put Data Product
  Future<Response> putDataSales({
    required String product,
  }) =>
      post(
        '${NetConst.MY_ENGINE}UpdateData',
        <String, dynamic>{
          "KEY": "YhNnM/2K++gp/FMWA+m0Pg==",
          "pmethod": "insert sales",
          "pdata1": "SO-1112",
          "pdata2": "Puri",
          "pdata3": "Grab Instan",
          "pdata4": "OVO",
          "pdata5": "JK",
          "pdataDetail": product,
        },
      );

  // Get Data Product
  Future<Response> getDataProduct() => post(
        '${NetConst.MY_ENGINE}GetMasterData',
        {
          "KEY": "YhNnM/2K++gp/FMWA+m0Pg==",
          "pmethod": "Get Product",
          "pemail": "JK",
          "pwhere6": "1",
          "pwhere7": "4",
        },
      );

  // Get Data Product After
  Future<Response> getDataSalesList(String today, String nextDay) => post(
        '${NetConst.MY_ENGINE}GetMasterData',
        {
          "KEY": "YhNnM/2K++gp/FMWA+m0Pg==",
          "pmethod": "Get Sales List",
          "pemail": "JK",
          "pwhere2": today,
          "pwhere3": nextDay,
          "pwhere6": "1",
          "pwhere7": "4"
        },
      );
}
