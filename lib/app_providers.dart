import 'package:product_busymed/data/repository/product_repository.dart';
import 'package:product_busymed/di/get_it_di.dart' as getIt;

import 'package:product_busymed/view_models/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> get allProviders {
    final List<SingleChildWidget> viewModelProviders = [
      ChangeNotifierProvider(
        create: (context) =>
            ProductViewModel(getIt.getInstance<ProductRepository>()),
      ),
    ];

    return [
      ...viewModelProviders,
    ];
  }
}
