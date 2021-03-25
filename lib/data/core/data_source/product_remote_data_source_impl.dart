import 'package:product_busymed/data/core/api_client.dart';
import 'package:product_busymed/data/core/data_source/product_remote_data_source.dart';
import 'package:product_busymed/data/models/products.dart';

class ProductRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final ApiClient _client;

  ProductRemoteDataSourceImpl(this._client);
  @override
  Future<ProductModel> getProduct() async {
    final response = await _client.get();
    final ProductModel productModel = ProductModel.fromJson(response);
    return productModel;
  }
}
