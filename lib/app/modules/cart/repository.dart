import 'package:my_caffee/app/data/models/products/product/product.dart';
import 'package:my_caffee/app/data/providers/local/dao/cart_dao.dart';
import 'package:my_caffee/app/data/providers/local/database.dart';

class CartsRepository {
  late final LocalDatabaseApi _api;
  late final CartDao? _cartDao;

  CartsRepository({required LocalDatabaseApi localDatabaseApi})
      : _api = localDatabaseApi;

  Future openDatabase() async {
    await _api.open().then((value) {
      _cartDao = CartDao(database: value);
    });
  }

  Future closeDatabase() async => await _api.close();

  Future deleteDatabase() async => await _api.destroy();

  bool isDatabaseOpen() => _api.isDatabaseOpen();

  Future getAll() async => await _cartDao!.getAll();

  Future insert(Product product) async =>
      await _cartDao!.insert(product: product);

  Future delete(int id) async => await _cartDao!.delete(id);
}
