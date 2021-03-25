import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'package:product_busymed/data/core/api_client.dart';
import 'package:product_busymed/data/core/data_source/product_remote_data_source.dart';
import 'package:product_busymed/data/core/data_source/product_remote_data_source_impl.dart';

import 'package:product_busymed/data/repository/product_repository.dart';
import 'package:product_busymed/data/repository/product_repository_impl.dart';

final getInstance = GetIt.instance;
Future<void> init() async {
  // Persisting favourites taking too long to save to sembast database unexpected error on the dependency injection, (problem might be new version of get it)

  // final appDir = await getApplicationDocumentsDirectory();
  // await appDir.create(recursive: true);
  // final databasePath = join(appDir.path, "sembast.db");
  // final database = await databaseFactoryIo.openDatabase(databasePath);

  // getInstance.registerLazySingleton<Database>(() => database);
  getInstance.registerLazySingleton<Client>(() => Client());
  getInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getInstance<Client>()));
  getInstance.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(getInstance<ApiClient>()));
  getInstance.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getInstance<ProductsRemoteDataSource>()));
  // getInstance.registerLazySingleton<ProductLocalRepository>(
  //     () => ProductLocalRepositoryImpl(getInstance<Database>()));
}
