// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subcribe/modules/home/screens/home_screen.dart';
import 'package:subcribe/services/navigation/navigation.dart';
import 'package:subcribe/shared/widgets/custom_snack_bar.dart';

import '../../../core/cubit/base_cubit_state.dart';
class SignUpCubit extends Cubit<BaseCubitState> {
  SignUpCubit() : super(BaseCubitState.initial);

  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(BaseCubitState.loading);

    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = result.user?.uid;
      if (userId == null) {
        throw FirebaseAuthException(
          code: 'user-null',
          message: 'User ID is null after creation.',
        );
      }

      // await FirebaseFirestore.instance.collection('users').doc(userId).set({
      //   'name': name,
      //   'email': email,
      //   'phone': phone,
      //   'created_at': DateTime.now(),
      // });

      // Navigate and then emit success state
      AppNavigation.navigateOffAll(const HomeScreen());
      emit(BaseCubitState.done);
    } on FirebaseAuthException catch (e) {
      emit(BaseCubitState.error);
      CustomSnackBars.showErrorToast(
        title: e.message ?? "Failed to create user.",
      );
    } catch (e) {
      emit(BaseCubitState.error);
      CustomSnackBars.showErrorToast(
        title: 'An unexpected error occurred. Please try again.',
      );
      print(e);
    }
  }
}
