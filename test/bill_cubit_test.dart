import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_text/cubit/bill_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BillCubit', () {
    BillCubit billCubit;

    setUp(() {
      billCubit = BillCubit();
    });

    tearDown(() {
      billCubit.close();
    });
    blocTest<BillCubit, BillState>(
      'emits new state with [amount]'
      'when change amount is called',
      build: () => billCubit,
      act: (cubit) => cubit.changeAmount('23.3'),
      verify: (cubit) => expect(cubit.state.amount == 23.3, true),
    );
  });
}
