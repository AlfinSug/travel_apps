import 'package:get_it/get_it.dart';

import 'api/CRUDModel.dart';
import 'api/services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setUpLocator() {
  locator.registerLazySingleton(() => Services('hotels'));
  locator.registerLazySingleton(() => CRUDModel());
}
