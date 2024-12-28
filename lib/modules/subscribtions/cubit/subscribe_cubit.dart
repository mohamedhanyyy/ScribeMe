import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subcribe/core/cubit/base_cubit_state.dart';
import 'package:subcribe/modules/payment/screens/payment_screen.dart';

import '../../../services/navigation/navigation.dart';

class SubscribeCubit extends Cubit<BaseCubitState> {
  SubscribeCubit() : super(BaseCubitState.initial);

  Future<void> subscribe(int id) async {
    AppNavigation.navigate(PaymentScreen());
  }
}
