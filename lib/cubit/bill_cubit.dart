import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bill_state.dart';

class BillCubit extends Cubit<BillState> {
  TextEditingController firstTextField;
  TextEditingController secondTextField;
  List<TextEditingController> textControllers = [];

  BillCubit() : super(BillState.initial()) {
    firstTextField = TextEditingController(text: '10');
    secondTextField = TextEditingController(text: '20');
    textControllers.addAll([firstTextField, secondTextField]);
  }

  void changeAmount(String amount) {
    final val = double.tryParse(amount);
    emit(state.copyWith(amount: val));
  }

  void _disposeTextControllers() {
    textControllers.forEach((element) {
      element.dispose();
    });
  }

  @override
  Future<void> close() {
    _disposeTextControllers();
    return super.close();
  }
}
