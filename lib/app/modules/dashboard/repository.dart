import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_caffee/app/data/models/products/product/product.dart';
import 'package:my_caffee/app/data/providers/firebase/authentication.dart';
import 'package:my_caffee/app/data/providers/firebase/database.dart';
import 'package:my_caffee/app/data/providers/local/database.dart';

class DashboardRepository {
  final FirebaseDatabaseApi databaseApi;
  final FirebaseAuthenticationApi authenticationApi;
  final LocalDatabaseApi localDatabaseApi;

  DashboardRepository({
    required this.databaseApi,
    required this.authenticationApi,
    required this.localDatabaseApi,
  });

  Stream<DatabaseEvent> products() => databaseApi.products();

  User? getCurrentUser() => authenticationApi.currentUser;

  Future<void> signOut() async => await authenticationApi.signOut();

  Future<void> createProduct(Product product) async =>
      await databaseApi.createProduct(product: product);

  Future<void> deleteProduct({required String id}) async =>
      await databaseApi.removeProduct(id: id);
}
