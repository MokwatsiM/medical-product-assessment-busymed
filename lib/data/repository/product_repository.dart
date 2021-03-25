import 'package:product_busymed/data/models/products.dart';

abstract class ProductRepository {
  Future<ProductModel> getProduct();
}
