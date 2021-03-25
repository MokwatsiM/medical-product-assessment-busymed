import 'package:flutter/cupertino.dart';
import 'package:product_busymed/data/models/products.dart';
import 'package:product_busymed/data/repository/product_repository.dart';
import 'package:product_busymed/utils/loading.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository productRepository;
  LoadingStatus _fetchState = LoadingStatus.not_fetched;
  List<Product> _products;

  ProductViewModel(this.productRepository);

  Future<List<Product>> getProduct() async {
    _fetchState = LoadingStatus.fetching;
    ProductModel prodModel;
    try {
      prodModel = await productRepository.getProduct();
      _products = prodModel.products;
      if (_products != null) {
        _fetchState = LoadingStatus.done;
        notifyListeners();
      } else {
        _fetchState = LoadingStatus.not_fetched;
        notifyListeners();
      }
      return _products;
    } catch (e) {
      _fetchState = LoadingStatus.error;
      notifyListeners();
      print(e);
      return null;
    }
  }

  LoadingStatus get fetchState => _fetchState;
  List<Product> get productList => _products;
}
