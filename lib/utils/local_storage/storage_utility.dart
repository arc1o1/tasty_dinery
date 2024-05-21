import 'package:get_storage/get_storage.dart';

class CcLocalStorage {
  // var
  late final GetStorage _storage;

  // singleton instance
  static CcLocalStorage? _instance;

  CcLocalStorage._internal();

  factory CcLocalStorage.instance() {
    _instance ??= CcLocalStorage._internal();

    return _instance!;
  }

  static Future<void> init(String buckettName) async {
    await GetStorage.init(buckettName);

    _instance = CcLocalStorage._internal();

    _instance!._storage = GetStorage(buckettName);
  }

  // generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // generic method to save data
  Future<void> writeData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }

  // instantiation
  // LocalStorage localStorage = LocalStorage();

  // read data
  // String? username = localStorage.readData<String>('username');

  // save data
  // localStorage.saveData('username', 'mwesiga');

  // remove data
  // localStorage.removeData('username');

  // clear all
  // localStorage.clearAll();
}
