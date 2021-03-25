import 'package:product_busymed/data/core/data_source/product_remote_data_source.dart';
import 'package:product_busymed/data/models/products.dart';
import 'package:product_busymed/data/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductsRemoteDataSource _productsRemoteDataSource;

  ProductRepositoryImpl(this._productsRemoteDataSource);
  @override
  Future<ProductModel> getProduct() async {
    try {
      final product = await _productsRemoteDataSource.getProduct();
      return product;
    } catch (e) {
      print("Something went wrong " + e.toString());
      return null;
    }
  }
}
