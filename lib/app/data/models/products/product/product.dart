import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const Product._();
  const factory Product.pure({
    String? uuid,
    String? name,
    String? description,
    double? price,
    String? category,
    String? image,
  }) = _Pure;

  const factory Product.cart({
    int? id,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'product_name') String? name,
    @JsonKey(name: 'product_description') String? description,
    @JsonKey(name: 'product_price') double? price,
    @JsonKey(name: 'product_category') String? category,
    @JsonKey(name: 'product_image') String? image,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'product_quantity') int? quantity,
  }) = _Cart;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
