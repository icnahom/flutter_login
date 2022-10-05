import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/auth/cubit/auth_state.dart';
import 'package:flutter_login/auth/services/auth_service.dart';
import 'package:flutter_login/service_locator.dart';

import '../models/user.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  Future<void> logIn(User user) async {
    emit(const AuthState.loading());
    try {
      user = await getIt.get<AuthService>().logIn(user);
      emit(AuthState.success(user));
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  void logOut() {
    emit(const AuthState.initial());
  }
}
