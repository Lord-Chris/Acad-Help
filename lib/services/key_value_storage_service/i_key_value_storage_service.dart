abstract class IKeyValueStorageService {
  Future<void> saveString({required String key, required String value});
  Future<void> saveBool({required String key, required bool value});
  Future<void> saveMap({
    required String key,
    required Map<String, dynamic> value,
  });

  String? readString({required String key, String? def});
  bool? readBool({required String key, bool? def});
  Map<String, dynamic>? readMap({
    required String key,
    Map<String, dynamic>? def,
  });

  Future<void> delete({required String key});
}
