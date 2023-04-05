part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainEventLogin extends MainEvent {
  const MainEventLogin({required this.password, required this.username});
  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}