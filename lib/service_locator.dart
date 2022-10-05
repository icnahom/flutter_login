import 'package:flutter_login/auth/services/auth_service.dart';
import 'package:flutter_login/shared/mocks/mock_request.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

final getIt = GetIt.instance;

void setupServiceLocator({bool testing = false}) {
  if (!testing) {
    getIt.registerLazySingleton<http.Client>(() => http.Client());
  } else {
    getIt.registerLazySingleton<http.Client>(() => MockClient(mockRequest));
  }
  getIt.registerLazySingleton(() => AuthService());
}
