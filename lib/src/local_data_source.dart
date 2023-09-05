



import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource{
  Future<bool> store(StorageLogInKey key,String data);
  String? read(StorageLogInKey key);
  Future<bool>remove(StorageLogInKey key);
}

class LocalDataSourceImpl implements LocalDataSource{
  final SharedPreferences db;
  const LocalDataSourceImpl({required this.db});

  static Future<SharedPreferences> get init async{
    return SharedPreferences.getInstance();
  }

  @override
  String? read(StorageLogInKey key) {
    return db.getString(key.name);
  }

  @override
  Future<bool> remove(StorageLogInKey key) {
    return db.remove(key.name);
  }

  @override
  Future<bool> store(StorageLogInKey key, String data) async{
    return await db.setString(key.name, data);
  }
}

enum StorageLogInKey{
  login,
}