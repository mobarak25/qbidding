import 'package:qbidding/features/app/domain/entities/areas.dart';

class EntityMap {
  static T? fromJson<T, K>(dynamic json) {
    switch (T) {
      case Areas:
        return Areas.fromJson(json) as T;

      default:
        throw Exception('Unknown class');
    }
  }
}
