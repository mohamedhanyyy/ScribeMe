// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:subcribe/modules/auth/repository/auth_repository.dart';
// import 'package:subcribe/shared/widgets/custom_snack_bar.dart';
//
// import '../../../core/cubit/base_cubit_state.dart';
//
// class LoginCubit extends Cubit<BaseCubitState> {
//   final authRepository = GetIt.instance.get<AuthRepository>();
//
//   LoginCubit() : super(BaseCubitState.initial);
//
//   Future<void> login({required String email, required String password}) async {
//     final result = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);
//     if (result.user?.displayName == null) {
//       CustomSnackBars.showErrorToast(title: "Error Login");
//       emit(BaseCubitState.error);
//     } else {
//       emit(BaseCubitState.done);
//     }
//   }
// }
