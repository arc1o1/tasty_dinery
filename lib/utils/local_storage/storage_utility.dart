import 'package:get_storage/get_storage.dart';

class CcLocalStorage {
  static final CcLocalStorage _instance = CcLocalStorage._internal();

  factory CcLocalStorage() {
    return _instance;
  }

  CcLocalStorage._internal();

  final _storage = GetStorage();

  // generic method to save data
  Future<void> saveData<Cc>(String key, Cc value) async {
    await _storage.write(key, value);
  }

  // generic method to read data
  Cc? readData<Cc>(String key) {
    return _storage.read<Cc>(key);
  }

  // generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
