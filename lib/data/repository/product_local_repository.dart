import 'package:product_busymed/data/models/products.dart';

abstract class ProductLocalRepository {
  Future<int> insertProductLocally(Product product);

  Future updateProduct(Product product);

  Future deleteProduct(int productId);

  Future<List<Product>> getAllLocalProduct();
}
