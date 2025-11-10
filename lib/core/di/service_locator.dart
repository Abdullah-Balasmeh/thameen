import 'package:get_it/get_it.dart';
import 'package:thameen/core/providers/locale_provider.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => LocaleProvider());
}
