// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'pure':
      return _Pure.fromJson(json);
    case 'cart':
      return _Cart.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Product',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Product {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? uuid, String? name, String? description,
            double? price, String? category, String? image)
        pure,
    required TResult Function(
            int? id,
            @JsonKey(name: 'product_id') String? productId,
            @JsonKey(name: 'product_name') String? name,
            @JsonKey(name: 'product_description') String? description,
            @JsonKey(name: 'product_price') double? price,
            @JsonKey(name: 'product_category') String? category,
            @JsonKey(name: 'product_image') String? image,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'product_quantity') int? quantity)
        cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? uuid, String? name, String? description,
            double? price, String? category, String? image)?
        pure,
    TResult? Function(
            int? id,
            @JsonKey(name: 'product_id') String? productId,
            @JsonKey(name: 'product_name') String? name,
            @JsonKey(name: 'product_description') String? description,
            @JsonKey(name: 'product_price') double? price,
            @JsonKey(name: 'product_category') String? category,
            @JsonKey(name: 'product_image') String? image,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'product_quantity') int? quantity)?
        cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? uuid, String? name, String? description,
            double? price, String? category, String? image)?
        pure,
    TResult Function(
            int? id,
            @JsonKey(name: 'product_id') String? productId,
            @JsonKey(name: 'product_name') String? name,
            @JsonKey(name: 'product_description') String? description,
            @JsonKey(name: 'product_price') double? price,
            @JsonKey(name: 'product_category') String? category,
            @JsonKey(name: 'product_image') String? image,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'product_quantity') int? quantity)?
        cart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pure value) pure,
    required TResult Function(_Cart value) cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pure value)? pure,
    TResult? Function(_Cart value)? cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pure value)? pure,
    TResult Function(_Cart value)? cart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String? name,
      String? description,
      double? price,
      String? category,
      String? image});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? category = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PureCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_PureCopyWith(_$_Pure value, $Res Function(_$_Pure) then) =
      __$$_PureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      String? name,
      String? description,
      double? price,
      String? category,
      String? image});
}

/// @nodoc
class __$$_PureCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res, _$_Pure>
    implements _$$_PureCopyWith<$Res> {
  __$$_PureCopyWithImpl(_$_Pure _value, $Res Function(_$_Pure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? category = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_Pure(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Pure extends _Pure {
  const _$_Pure(
      {this.uuid,
      this.name,
      this.description,
      this.price,
      this.category,
      this.image,
      final String? $type})
      : $type = $type ?? 'pure',
        super._();

  factory _$_Pure.fromJson(Map<String, dynamic> json) => _$$_PureFromJson(json);

  @override
  final String? uuid;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? price;
  @override
  final String? category;
  @override
  final String? image;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Product.pure(uuid: $uuid, name: $name, description: $description, price: $price, category: $category, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pure &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, name, description, price, category, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PureCopyWith<_$_Pure> get copyWith =>
      __$$_PureCopyWithImpl<_$_Pure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? uuid, String? name, String? description,
            double? price, String? category, String? image)
        pure,
    required TResult Function(
            int? id,
            @JsonKey(name: 'product_id') String? productId,
            @JsonKey(name: 'product_name') String? name,
            @JsonKey(name: 'product_description') String? description,
            @JsonKey(name: 'product_price') double? price,
            @JsonKey(name: 'product_category') String? category,
            @JsonKey(name: 'product_image') String? image,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'product_quantity') int? quantity)
        cart,
  }) {
    return pure(uuid, name, description, price, category, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? uuid, String? name, String? description,
            double? price, String? category, String? image)?
        pure,
    TResult? Function(
            int? id,
            @JsonKey(name: 'product_id') String? productId,
            @JsonKey(name: 'product_name') String? name,
            @JsonKey(name: 'product_description') String? description,
            @JsonKey(name: 'product_price') double? price,
            @JsonKey(name: 'product_category') String? category,
            @JsonKey(name: 'product_image') String? image,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'product_quantity') int? quantity)?
        cart,
  }) {
    return pure?.call(uuid, name, description, price, category, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? uuid, String? name, String? description,
            double? price, String? category, String? image)?
        pure,
    TResult Function(
            int? id,
            @JsonKey(name: 'product_id') String? productId,
            @JsonKey(name: 'product_name') String? name,
            @JsonKey(name: 'product_description') String? description,
            @JsonKey(name: 'product_price') double? price,
            @JsonKey(name: 'product_category') String? category,
            @JsonKey(name: 'product_image') String? image,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'product_quantity') int? quantity)?
        cart,
    required TResult orElse(),
  }) {
    if (pure != null) {
      return pure(uuid, name, description, price, category, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pure value) pure,
    required TResult Function(_Cart value) cart,
  }) {
    return pure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pure value)? pure,
    TResult? Function(_Cart value)? cart,
  }) {
    return pure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pure value)? pure,
    TResult Function(_Cart value)? cart,
    required TResult orElse(),
  }) {
    if (pure != null) {
      return pure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_PureToJson(
      this,
    );
  }
}

abstract class _Pure extends Product {
  const factory _Pure(
      {final String? uuid,
      final String? name,
      final String? description,
      final double? price,
      final String? category,
      final String? image}) = _$_Pure;
  const _Pure._() : super._();

  factory _Pure.fromJson(Map<String, dynamic> json) = _$_Pure.fromJson;

  String? get uuid;
  @override
  String? get name;
  @override
  String? get description;
  @override
  double? get price;
  @override
  String? get category;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_PureCopyWith<_$_Pure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CartCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_CartCopyWith(_$_Cart value, $Res Function(_$_Cart) then) =
      __$$_CartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'product_id') String? productId,
      @JsonKey(name: 'product_name') String? name,
      @JsonKey(name: 'product_description') String? description,
      @JsonKey(name: 'product_price') double? price,
      @JsonKey(name: 'product_category') String? category,
      @JsonKey(name: 'product_image') String? image,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'product_quantity') int? quantity});
}

/// @nodoc
class __$$_CartCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res, _$_Cart>
    implements _$$_CartCopyWith<$Res> {
  __$$_CartCopyWithImpl(_$_Cart _value, $Res Function(_$_Cart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? category = freezed,
    Object? image = freezed,
    Object? userId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_Cart(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cart extends _Cart {
  const _$_Cart(
      {this.id,
      @JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'product_name') this.name,
      @JsonKey(name: 'product_description') this.description,
      @JsonKey(name: 'product_price') this.price,
      @JsonKey(name: 'product_category') this.category,
      @JsonKey(name: 'product_image') this.image,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'product_quantity') this.quantity,
      final String? $type})
      : $type = $type ?? 'cart',
        super._();

  factory _$_Cart.fromJson(Map<String, dynamic> json) => _$$_CartFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'product_id')
  final String? productId;
  @override
  @JsonKey(name: 'product_name')
  final String? name;
  @override
  @JsonKey(name: 'product_description')
  final String? description;
  @override
  @JsonKey(name: 'product_price')
  final double? price;
  @override
  @JsonKey(name: 'product_category')
  final String? category;
  @override
  @JsonKey(name: 'product_image')
  final String? image;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'product_quantity')
  final int? quantity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Product.cart(id: $id, productId: $productId, name: $name, description: $description, price: $price, category: $category, image: $image, userId: $userId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cart &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, name, description,
      price, category, image, userId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartCopyWith<_$_Cart> get copyWith =>
      __$$_CartCopyWithImpl<_$_Cart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? uuid, String? name, String? description,
            double? price, String? category, String? image)
        pure,
    required TResult Function(
            int? id,
            @JsonKey(name: 'product_id') String? productId,
            @JsonKey(name: 'product_name') String? name,
            @JsonKey(name: 'product_description') String? description,
            @JsonKey(name: 'product_price') double? price,
            @JsonKey(name: 'product_category') String? category,
            @JsonKey(name: 'product_image') String? image,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'product_quantity') int? quantity)
        cart,
  }) {
    return cart(id, productId, name, description, price, category, image,
        userId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? uuid, String? name, String? description,
            double? price, String? category, String? image)?
        pure,
    TResult? Function(
            int? id,
            @JsonKey(name: 'product_id') String? productId,
            @JsonKey(name: 'product_name') String? name,
            @JsonKey(name: 'product_description') String? description,
            @JsonKey(name: 'product_price') double? price,
            @JsonKey(name: 'product_category') String? category,
            @JsonKey(name: 'product_image') String? image,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'product_quantity') int? quantity)?
        cart,
  }) {
    return cart?.call(id, productId, name, description, price, category, image,
        userId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? uuid, String? name, String? description,
            double? price, String? category, String? image)?
        pure,
    TResult Function(
            int? id,
            @JsonKey(name: 'product_id') String? productId,
            @JsonKey(name: 'product_name') String? name,
            @JsonKey(name: 'product_description') String? description,
            @JsonKey(name: 'product_price') double? price,
            @JsonKey(name: 'product_category') String? category,
            @JsonKey(name: 'product_image') String? image,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'product_quantity') int? quantity)?
        cart,
    required TResult orElse(),
  }) {
    if (cart != null) {
      return cart(id, productId, name, description, price, category, image,
          userId, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pure value) pure,
    required TResult Function(_Cart value) cart,
  }) {
    return cart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pure value)? pure,
    TResult? Function(_Cart value)? cart,
  }) {
    return cart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pure value)? pure,
    TResult Function(_Cart value)? cart,
    required TResult orElse(),
  }) {
    if (cart != null) {
      return cart(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartToJson(
      this,
    );
  }
}

abstract class _Cart extends Product {
  const factory _Cart(
      {final int? id,
      @JsonKey(name: 'product_id') final String? productId,
      @JsonKey(name: 'product_name') final String? name,
      @JsonKey(name: 'product_description') final String? description,
      @JsonKey(name: 'product_price') final double? price,
      @JsonKey(name: 'product_category') final String? category,
      @JsonKey(name: 'product_image') final String? image,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'product_quantity') final int? quantity}) = _$_Cart;
  const _Cart._() : super._();

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  int? get id;
  @JsonKey(name: 'product_id')
  String? get productId;
  @override
  @JsonKey(name: 'product_name')
  String? get name;
  @override
  @JsonKey(name: 'product_description')
  String? get description;
  @override
  @JsonKey(name: 'product_price')
  double? get price;
  @override
  @JsonKey(name: 'product_category')
  String? get category;
  @override
  @JsonKey(name: 'product_image')
  String? get image;
  @JsonKey(name: 'user_id')
  String? get userId;
  @JsonKey(name: 'product_quantity')
  int? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_CartCopyWith<_$_Cart> get copyWith => throw _privateConstructorUsedError;
}
