part of 'main_cubit.dart';

enum MainStatus{
  init,
  loading,
  success,
  error,
}

class MainState extends Equatable {
  final MainStatus mainStatus;
  final List<User> users;
  final String errorMessage;

  const MainState({
    this.mainStatus = MainStatus.init,
    this.users = const [],
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [mainStatus, users, errorMessage];

  MainState copyWith({
    MainStatus? mainStatus,
    List<User>? users,
    String? errorMessage,
  }) {
    return MainState(
      mainStatus: mainStatus ?? this.mainStatus,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
