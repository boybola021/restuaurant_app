import 'dart:convert';

import 'package:restaurant_app/src/user_login_model.dart';

import 'local_data_source.dart';

abstract class UserRepository{
  Future<bool> storeUser(User login);
  List<User> readUser();
  Future<bool> delateUser(User login);
  Future<bool> clareCache();
  Future<bool> editUser(User login);
}
class UserRepositoryImplements implements UserRepository{
  final LocalDataSource dataSource;
  const UserRepositoryImplements({required this.dataSource});
  @override
  Future<bool> clareCache() {
    return dataSource.remove(StorageLogInKey.login);
  }

  @override
  Future<bool> delateUser(User login) {
    final list = readUser();
    list.remove(login);
    final json = list.map((e) => e.toJson()).toList();
    final data = jsonEncode(json);
    return dataSource.store(StorageLogInKey.login, data);
  }


  @override
  List<User> readUser() {
    String data = dataSource.read(StorageLogInKey.login) ?? "[]";
    final json = jsonDecode(data) as List;
    return json.map((item) => User.fromJson(item as Map<String,dynamic>)).toList();
  }

  @override
  Future<bool> storeUser(User login) async{
    final list = readUser();
    list.clear();
    list.add(login);
    final json = list.map((login) => login.toJson()).toList();
    final data = jsonEncode(json);
    return await dataSource.store(StorageLogInKey.login, data);
  }

  @override
  Future<bool> editUser(User login) {
    final list = readUser();
    list.removeWhere((element) => element.id == login.id);
    list.add(login);
    final json = list.map((e) => e.toJson()).toList();
    final data = jsonEncode(json);
    return dataSource.store(StorageLogInKey.login, data);
  }
}