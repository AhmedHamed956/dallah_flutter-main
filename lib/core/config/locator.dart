import 'package:dallah/viewModel/auth_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthViewModel>(() => AuthViewModel());

}
