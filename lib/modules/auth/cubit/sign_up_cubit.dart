import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subcribe/shared/widgets/custom_snack_bar.dart';

import '../../../core/cubit/base_cubit_state.dart';

class SignUpCubit extends Cubit<BaseCubitState> {
  SignUpCubit() : super(BaseCubitState.initial);

  Future<void> signUp(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    emit(BaseCubitState.loading);
    final result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (result.user?.displayName == null) {
      CustomSnackBars.showErrorToast(title: "Error Register");
      emit(BaseCubitState.error);
    } else {
      emit(BaseCubitState.done);
    }
  }
}
