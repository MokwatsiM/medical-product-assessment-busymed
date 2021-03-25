import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_busymed/di/get_it_di.dart' as getIt;
import 'package:pedantic/pedantic.dart';
import 'package:product_busymed/views/product_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: ProductList(),
    );
  }
}
