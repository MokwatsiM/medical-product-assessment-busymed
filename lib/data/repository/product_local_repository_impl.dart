import 'package:product_busymed/data/models/products.dart';
import 'package:product_busymed/data/repository/product_local_repository.dart';
import 'package:sembast/sembast.dart';

class ProductLocalRepositoryImpl extends ProductLocalRepository {
  final Database _database;
  final StoreRef _store = intMapStoreFactory.store("medical_store");
  ProductLocalRepositoryImpl(this._database) {
    print("product local initialised");
  }

  @override
  Future deleteProduct(int productId) async {
    await _store.record(productId).delete(_database);
  }

  @override
  Future<List<Product>> getAllLocalProduct() async {
    final snapshots = await _store.find(_database);
    return snapshots
        .map((snapshot) => Product.fromJson(snapshot.value))
        .toList(growable: false);
  }

  @override
  Future<int> insertProductLocally(Product product) async {
    return await _store.add(_database, product.toJson());
  }

  @override
  Future updateProduct(Product product) async {
    await _store.record(product.id).update(_database, Product().toJson());
  }
}
