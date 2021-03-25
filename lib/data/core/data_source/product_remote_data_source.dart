

import 'package:product_busymed/data/models/products.dart';

abstract class ProductsRemoteDataSource{
  Future<ProductModel>  getProduct();
}