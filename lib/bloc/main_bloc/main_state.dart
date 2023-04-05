part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class MainStateLoginSuccessful extends MainState {
  const MainStateLoginSuccessful({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class MainStateLoginFail extends MainState {
  const MainStateLoginFail({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}