// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pure _$$_PureFromJson(Map<String, dynamic> json) => _$_Pure(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'] as String?,
      image: json['image'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_PureToJson(_$_Pure instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'image': instance.image,
      'runtimeType': instance.$type,
    };

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      id: json['id'] as int?,
      productId: json['product_id'] as String?,
      name: json['product_name'] as String?,
      description: json['product_description'] as String?,
      price: (json['product_price'] as num?)?.toDouble(),
      category: json['product_category'] as String?,
      image: json['product_image'] as String?,
      userId: json['user_id'] as String?,
      quantity: json['product_quantity'] as int?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.name,
      'product_description': instance.description,
      'product_price': instance.price,
      'product_category': instance.category,
      'product_image': instance.image,
      'user_id': instance.userId,
      'product_quantity': instance.quantity,
      'runtimeType': instance.$type,
    };
