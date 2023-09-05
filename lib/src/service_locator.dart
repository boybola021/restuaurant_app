
import 'local_data_source.dart';
import 'login_repozitory.dart';

late final UserRepository logInRepository;
Future<void> serviceLocatorLocal()async{
  final db = await LocalDataSourceImpl.init;
  LocalDataSource loginSource = LocalDataSourceImpl(db: db);
  logInRepository = UserRepositoryImplements(dataSource: loginSource);
}