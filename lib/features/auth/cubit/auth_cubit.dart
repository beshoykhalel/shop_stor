import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_stor/core/utils/service_locator.dart';
import 'package:shop_stor/core/utils/storage_helper.dart';
import 'package:shop_stor/features/auth/cubit/auth_state.dart';
import 'package:shop_stor/features/auth/models/login_response_model.dart';
import 'package:shop_stor/features/auth/repo/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInital());
  final AuthRepo _authRepo;
  void login({required String userName, required String password}) async {
    emit(LoadingAuthState());

    final Either<String, LoginResponseModel> res =
        await _authRepo.login(userName, password);

    res.fold((error) {
      emit(ErrorAuthState(error));
    }, (right) {
      emit(SuccessAuthState("Login Successfully"));
    });
  }

  void logout() {
    sl<StorageHelper>().removeToken();
  }
}
