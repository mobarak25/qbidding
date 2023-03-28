import 'package:qbidding/features/app/domain/entities/default_response.dart';
import 'package:qbidding/features/app/domain/entities/login_response.dart';

class EntityMap {
  static T? fromJson<T, K>(dynamic json) {
    switch (T) {
      case DefaultResponse:
        return DefaultResponse.fromJson(json) as T;
      case LogInResponse:
        return LogInResponse.fromJson(json) as T;

      default:
        throw Exception('Unknown class');
    }
  }
}
