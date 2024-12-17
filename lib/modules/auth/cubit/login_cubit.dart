import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:subcribe/modules/home/screens/home_screen.dart';
import 'package:subcribe/services/navigation/navigation.dart';
import 'package:subcribe/shared/widgets/custom_snack_bar.dart';

import '../../../core/cubit/base_cubit_state.dart';

class LoginCubit extends Cubit<BaseCubitState> {
  LoginCubit() : super(BaseCubitState.initial);
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
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
        AppNavigation.navigateOffAll(const HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      CustomSnackBars.showErrorToast(title: e.message!);
      emit(BaseCubitState.error);
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user?.uid != null) {
        AppNavigation.navigateOffAll(const HomeScreen());
        return userCredential.user;
      }
    } catch (e) {
      debugPrint("Error signing in with Google: $e");
      return null;
    }
    return null;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
