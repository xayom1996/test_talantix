import 'package:test_talantix/features/data/data_sources/user_remote_data_source.dart';
import 'package:test_talantix/features/data/models/user.dart';

class UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepository({required this.userRemoteDataSource});

  Future<List<User>> getUsers() async {
    return await userRemoteDataSource.getUsers();
  }
}