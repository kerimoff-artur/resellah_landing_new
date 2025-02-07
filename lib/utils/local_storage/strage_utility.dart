import 'package:get_storage/get_storage.dart';

class StorageUtilityLocal {
  static final StorageUtilityLocal _instance = StorageUtilityLocal._internal();
  factory StorageUtilityLocal() {
    return _instance;
  }

  StorageUtilityLocal._internal();

  final _storage = GetStorage();

  Future<void> saveData<S>(String key, S value) async {
    await _storage.write(key, value);
  }

S? readData<S>(String key) {
  return _storage.read<S>(key);
}

Future<void> deleteData(String key) async {
  await _storage.remove(key);
}

Future<void> clearAllData() async {
  await _storage.erase();
}

}
