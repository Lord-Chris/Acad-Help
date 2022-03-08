import 'package:get_storage/get_storage.dart';
import 'i_key_value_storage_service.dart';

class KeyValueStorageService implements IKeyValueStorageService {
  final _storage = GetStorage();

  @override
  Future<void> saveString({required String key, required String value}) async {
    await _storage.write(key, value);
  }

  @override
  Future<void> saveBool({required String key, required bool value}) async {
    await _storage.write(key, value);
  }

  @override
  Future<void> saveMap(
      {required String key, required Map<String, dynamic> value}) async {
    await _storage.write(key, value);
  }

  @override
  String? readString({required String key, String? def}) {
    return _storage.read<String>(key) ?? def;
  }

  @override
  bool? readBool({required String key, bool? def}) {
    return _storage.read<bool>(key) ?? def;
  }

  @override
  Map<String, dynamic>? readMap(
      {required String key, Map<String, dynamic>? def}) {
    return _storage.read<Map<String, dynamic>>(key) ?? def;
  }

  @override
  Future<void> delete({required String key}) async {
    return await _storage.remove(key);
  }
}
