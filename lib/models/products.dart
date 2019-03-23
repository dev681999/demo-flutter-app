// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Product> productsFromJson(String str) {
  final jsonData = json.decode(str);
  if (jsonData["products"] == null) {
    return [];
  }

  return List<Product>.from(
    jsonData["products"].map((x) => Product.fromJson(x)),
  );
}

String productsToJson(List<ProductData> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

ProductData productFromJson(String str) {
  final jsonData = json.decode(str);
  return ProductData.fromJson(jsonData);
}

class ProductData {
  List<Image> images;
  Product product;
  User user;
  User buyer;

  ProductData({
    this.images,
    this.product,
    this.user,
    this.buyer,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        buyer: json["buyer"] == null ? null : User.fromJson(json["buyer"]),
      );

  Map<String, dynamic> toJson() => {
        "images": images == null
            ? null
            : List<dynamic>.from(images.map((x) => x.toJson())),
        "product": product == null ? null : product.toJson(),
        "user": user == null ? null : user.toJson(),
        "buyer": buyer == null ? null : buyer.toJson(),
      };
}

class Image {
  String id;
  String imageId;
  String caption;

  Image({
    this.id,
    this.imageId,
    this.caption,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] == null ? null : json["id"],
        imageId: json["imageId"] == null ? null : json["imageId"],
        caption: json["caption"] == null ? null : json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "imageId": imageId == null ? null : imageId,
        "caption": caption == null ? null : caption,
      };
}

class Product {
  String id;
  String title;
  String owner;
  int price;
  List<String> images;
  bool isSold;
  String dateSold;
  bool isRequested;
  String buyer;
  String buyerAddress;
  String coverImage;
  String description;

  Product({
    this.id,
    this.title,
    this.owner,
    this.price,
    this.images,
    this.isSold,
    this.dateSold,
    this.isRequested,
    this.buyer,
    this.buyerAddress,
    this.coverImage,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        owner: json["owner"] == null ? null : json["owner"],
        price: json["price"] == null ? null : json["price"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        isSold: json["isSold"] == null ? null : json["isSold"],
        dateSold: json["dateSold"] == null ? null : json["dateSold"],
        isRequested: json["isRequested"] == null ? null : json["isRequested"],
        buyer: json["buyer"] == null ? null : json["buyer"],
        buyerAddress:
            json["buyerAddress"] == null ? null : json["buyerAddress"],
        coverImage: json["coverImage"] == null ? null : json["coverImage"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "owner": owner == null ? null : owner,
        "price": price == null ? null : price,
        "images":
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "isSold": isSold == null ? null : isSold,
        "dateSold": dateSold == null ? null : dateSold,
        "isRequested": isRequested == null ? null : isRequested,
        "buyer": buyer == null ? null : buyer,
        "buyerAddress": buyerAddress == null ? null : buyerAddress,
        "coverImage": coverImage == null ? null : coverImage,
        "description": description == null ? null : description,
      };
}

class User {
  String email;
  String name;
  String address;
  String phoneNumber;

  User({
    this.email,
    this.name,
    this.address,
    this.phoneNumber,
  });

  bool isEmpty() {
    return (email == "" || name == "" || name == null || email == null);
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"] == null ? null : json["email"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
      };
}
