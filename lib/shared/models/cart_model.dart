import 'dart:convert';

class CartModel {
  String id;
  String title;
  double price;
  CartModel({
    required this.id,
    required this.title,
    required this.price,
  });

  CartModel copyWith({
    String? id,
    String? title,
    double? price,
  }) {
    return CartModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      title: map['title'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  @override
  String toString() => 'CartModel(id: $id, title: $title, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel &&
        other.id == id &&
        other.title == title &&
        other.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ price.hashCode;
}
