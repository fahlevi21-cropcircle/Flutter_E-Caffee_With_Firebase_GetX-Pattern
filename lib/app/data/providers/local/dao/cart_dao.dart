import 'dart:developer';

import 'package:my_caffee/app/data/models/products/product/product.dart';
import 'package:sqflite/sqflite.dart';

class CartDao {
  final Database? _database;

  CartDao({Database? database}) : _database = database;

  final String tableName = "carts";
  final String columnId = "id";
  final String columnProductId = "product_id";
  final String columnProductName = "product_name";
  final String columnProductDescription = "product_description";
  final String columnProductPrice = "product_price";
  final String columnProductCategory = "product_category";
  final String columnProductImage = "product_image";
  final String columnProductQty = "product_quantity";
  final String columnUserId = "user_id";

  Future createTable() async {
    await _database!.execute(
      '''
          CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnProductName TEXT not null,
            $columnProductDescription TEXT not null,
            $columnProductPrice REAL not null,
            $columnProductId TEXT not null,
            $columnProductCategory TEXT not null,
            $columnProductImage TEXT not null,
            $columnProductQty INTEGER not null,
            $columnUserId TEXT not null
          )
        ''',
    );
  }

  Future getAll() async => await _database!.query(tableName);

  Future<Product?> getByProductId(String id) async {
    final List<Map> result = await _database!.query(
      tableName,
      where: '$columnProductId = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      var item = Map.of(result.first as Map<String, dynamic>);
      item["runtimeType"] = "cart";
      return Product.fromJson(item);
    }

    return null;
  }

  Future insert({required Product product}) async {
    Map<String, dynamic> values = Map.of(product.toJson());

    // check if product is already in cart
    var exist = await getByProductId(values["product_id"]);

    if (exist != null) {
      exist.mapOrNull(
        cart: (model) {
          // update only quantity
          var qty = values["product_quantity"] + model.quantity;
          exist = model.copyWith(quantity: qty);
        },
      );

      return await update(exist!);
    }

    // remove runtimeType to avoid error (or create column runtimeType in table)
    values.remove('runtimeType');

    return await _database!.insert(tableName, values);
  }

  Future update(Product product) async {
    Map<String, dynamic> values = Map.of(product.toJson());

    // remove runtimeType to avoid error (or create column runtimeType in table)
    values.remove('runtimeType');
    log(values.toString());

    return await _database!.update(
      tableName,
      values,
      where: '$columnId = ?',
      whereArgs: [values["id"]],
    );
  }

  Future delete(int id) async => await _database!
      .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
}
