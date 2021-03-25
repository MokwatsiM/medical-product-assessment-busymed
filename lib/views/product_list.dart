import 'package:flutter/material.dart';
import 'package:product_busymed/app_providers.dart';
import 'package:product_busymed/views/home/pages/home_screen.dart';
import 'package:product_busymed/views/themes/app_color.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.allProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
            primaryColor: AppColor.lightgray,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(elevation: 0)),
        home: HomeScreen(),
      ),
    );
  }
}
