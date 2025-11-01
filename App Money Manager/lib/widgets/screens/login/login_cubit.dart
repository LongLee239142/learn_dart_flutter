import 'package:appmoneymanager/common/enum/load_satatus.dart';
import 'package:appmoneymanager/repository/api.dart';
import 'package:bloc/bloc.dart';

import '../../../models/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Api api;

  LoginCubit(this.api) : super(LoginState.init());

  Future<void> checkLogin(Login login) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    await Future.delayed(const Duration(seconds: 2));
    var checkLogin = await api.checkLogin(login);
    if(checkLogin){
      emit(state.copyWith(loadStatus: LoadStatus.Done));
    }
    else {
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }
}
