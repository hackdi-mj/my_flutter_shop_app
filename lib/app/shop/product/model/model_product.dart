class Product {
  int? no;
  String? productId;
  String? productName;
  String? productDescription;
  String? productValue;
  String? productType;
  String? productPhoto;

  Product({
    this.no,
    this.productId,
    this.productName,
    this.productDescription,
    this.productValue,
    this.productType,
    this.productPhoto,
  });

  factory Product.fromJson(Map<String, dynamic>? json) {
    return Product(
      no: json?['NO'],
      productId: json?['productId'],
      productName: json?['productName'],
      productDescription: json?['productDescription'],
      productValue: json?['productValue'],
      productType: json?['productType'],
      productPhoto: json?['productPhoto'],
    );
  }

  Map<String, dynamic> toJson() => {
        "NO": no,
        "productId": productId,
        "productName": productName,
        "productDescription": productDescription,
        "productValue": productValue,
        "productType": productType,
        "productPhoto": productPhoto,
      };
}
