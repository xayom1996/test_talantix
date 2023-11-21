import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_talantix/features/data/models/user.dart';
import 'package:test_talantix/features/data/repositories/user_repository.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final UserRepository userRepository;

  MainCubit({required this.userRepository}) : super(const MainState());

  void getUsers() async {
    emit(state.copyWith(mainStatus: MainStatus.loading));
    try {
      List<User> users = await userRepository.getUsers();
      emit(
        state.copyWith(
          mainStatus: MainStatus.success,
          users: users,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          mainStatus: MainStatus.error,
          errorMessage: _.toString().replaceAll('Exception:', ''),
        )
      );
    }
  }
}
