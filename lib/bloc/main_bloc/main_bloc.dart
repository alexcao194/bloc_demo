import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEventLogin>(_onLogin);
  }

  FutureOr<void> _onLogin(MainEventLogin event, Emitter<MainState> emit) {
    var username = event.username;
    var password = event.password;
    if(username == 'alex' && password == '123') {
      emit(const MainStateLoginSuccessful(message: 'Đăng nhập thành công'));
    } else {
      emit(const MainStateLoginFail(error: 'Đăng nhập thất bại'));
    }
  }
}
