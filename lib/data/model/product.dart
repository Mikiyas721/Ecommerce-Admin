import 'package:flutter/material.dart';
import '../../utils/enums/productCategory.dart';
import '../../utils/enums/condition.dart';

class Product {
  String id;
  String myId;
  String name;
  String imageName;
  String description;
  final String container = 'product';
  double price;
  int quantity;
  DateTime postedTime;
  ProductCategory category;
  Condition condition;
  bool swappable;
  List swapOptions = [];
  String phoneNumber;
  bool approved;

  Product(
      {this.id,
      @required this.myId,
      @required this.name,
      @required this.imageName,
      @required this.description,
      @required this.price,
      @required this.quantity,
      @required this.postedTime,
      @required this.condition,
      @required this.category,
      @required this.phoneNumber,
      this.swappable = false,
      this.swapOptions,
      this.approved = false});

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
        id: map['id'],
        myId: map['myId'],
        name: map['name'],
        imageName: map['imageName'],
        description: map['description'],
        price: map['price'].toDouble(),
        quantity: map['quantity'],
        postedTime: DateTime.parse(map['postedTime']),
        condition: ConditionExtension.fromString(map['condition']),
        category: ProductCategoryExtension.fromString(map['category']),
        phoneNumber: map['phoneNumber'].toString(),
        swapOptions: map['swapOptions'],
        swappable: map['swappable'],
        approved: map['approved']);
  }

  Map<String, dynamic> toJSON() {
    return {
      'myId': myId,
      'name': name,
      'imageName': imageName,
      'description': description,
      'container': container,
      'price': price,
      'quantity': quantity,
      'postedTime': postedTime.toString(),
      'category': category.getString(),
      'condition': condition.getString(),
      'phoneNumber': int.parse(phoneNumber),
      'swappable': swappable,
      'swapOptions': swapOptions,
      'approved': approved
    };
  }

  String getSwappableString() {
    if (swappable)
      return 'Yes';
    else
      return 'No';
  }
}
