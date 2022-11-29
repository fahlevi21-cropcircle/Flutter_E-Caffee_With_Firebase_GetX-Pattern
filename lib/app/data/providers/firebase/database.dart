import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:my_caffee/app/data/models/products/product/product.dart';

class FirebaseDatabaseApi {
  final DatabaseReference parent;
  var productsPath = "products";
  late DatabaseReference productsRef;

  FirebaseDatabaseApi({required this.parent}) {
    productsRef = parent.child(productsPath);
  }

  // listen to [products] node changes
  Stream<DatabaseEvent> products() => productsRef.onValue;

  Future<void> createProduct({required Product product}) async =>
      await productsRef.push().set(product.toJson());

  Future<void> removeProduct({required String id}) async =>
      await productsRef.child(id).remove();
}
