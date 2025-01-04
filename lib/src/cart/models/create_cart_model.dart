// To parse this JSON data, do
//
//     final createCartModel = createCartModelFromJson(jsonString);

import 'dart:convert';

CreateCartModel createCartModelFromJson(String str) =>
    CreateCartModel.fromJson(json.decode(str));

String createCartModelToJson(CreateCartModel data) =>
    json.encode(data.toJson());

class CreateCartModel {
  final int product;
  final int quantity;

  CreateCartModel({
    required this.product,
    required this.quantity,
  });

  factory CreateCartModel.fromJson(Map<String, dynamic> json) =>
      CreateCartModel(
        product: json["product"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
      };
}
