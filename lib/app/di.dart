import 'package:get_it/get_it.dart';
import 'package:test_talantix/features/data/data_sources/user_remote_data_source.dart';
import 'package:test_talantix/features/data/repositories/user_repository.dart';
import 'package:test_talantix/features/presentation/blocs/main/main_cubit.dart';

final GetIt di = GetIt.instance;

Future<void> diInit() async {
  // start register services
  // end register services

  // start register Bloc
  di.registerLazySingleton(() => MainCubit(userRepository: di()));
  // end register Bloc

  // start remote source
  di.registerSingleton<UserRemoteDataSource>(UserRemoteDataSource());
  // end remote source

  // start repository
  di.registerFactory<UserRepository>(() => UserRepository(userRemoteDataSource: di()));
  // start repository

}