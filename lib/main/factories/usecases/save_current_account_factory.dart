import 'package:flutter_tdd_clean/data/usecases/save_current_account/local_save_current_account.dart';
import 'package:flutter_tdd_clean/domain/usecases/save_current_account.dart';
import 'package:flutter_tdd_clean/main/factories/factories.dart';

SaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
      saveSecureCacheStorage: makeLocalStorageAdapter());
}
