import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_tdd_clean/infra/cache/cache.dart';

LocalStorageAdapter makeLocalStorageAdapter() {
  final secureStorage = FlutterSecureStorage();
  return LocalStorageAdapter(secureStorage: secureStorage);
}
