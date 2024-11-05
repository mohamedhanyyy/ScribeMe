import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subcribe/modules/home/screens/home_screen.dart';
import 'package:subcribe/services/navigation/navigation.dart';
import 'package:subcribe/shared/widgets/custom_snack_bar.dart';

import '../../../core/cubit/base_cubit_state.dart';

class LoginCubit extends Cubit<BaseCubitState> {
  LoginCubit() : super(BaseCubitState.initial);

  Future<void> login({required String email, required String password}) async {
    emit(BaseCubitState.loading);

    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (result.user?.uid == null) {
        CustomSnackBars.showErrorToast(
            title: "Display name is not set for this user.");
        emit(BaseCubitState.error);
      } else {
        emit(BaseCubitState.done);
        AppNavigation.navigate(const HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      CustomSnackBars.showErrorToast(title: e.message!);
      emit(BaseCubitState.error);
    }
  }
}
