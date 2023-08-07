import 'package:gem_pos/api/api_service.dart';
import 'package:gem_pos/services/auth_service.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  DependencyInjection(this._getIt) {
    _getIt.registerSingleton<ApiService>(ApiService());
    final apiService = _getIt.get<ApiService>();
    _getIt.registerSingleton<AuthService>(AuthService(apiService));
  }
  final GetIt _getIt;
}
