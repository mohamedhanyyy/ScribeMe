import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subcribe/modules/home/screens/home_screen.dart';
import 'package:subcribe/services/navigation/navigation.dart';
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
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((e) {

      emit(BaseCubitState.error);

      if (e is FirebaseAuthException) {
        CustomSnackBars.showErrorToast(title: e.message ?? "Create user error");
      } else {
        CustomSnackBars.showErrorToast(
          title: 'An unexpected error occurred. Please try again.',
        );
      }
    });
    if (result.user?.uid != null) {
      emit(BaseCubitState.done);
      AppNavigation.navigate(const HomeScreen());
    } else {
      emit(BaseCubitState.error);
    }
  }
}
