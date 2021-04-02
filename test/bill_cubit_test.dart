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

    //Regular test that succeds.
    test('emits new state with [amount] when change amount is called', () {
      billCubit.changeAmount('23.3');
      expect(billCubit.state.amount == 23.3, true);
    });

    // Bloc Test that throws error.
    blocTest<BillCubit, BillState>(
      'emits new state with [amount]'
      'when change amount is called',
      build: () => billCubit,
      act: (cubit) => cubit.changeAmount('23.3'),
      verify: (cubit) => expect(cubit.state.amount == 23.3, true),
    );
  });
}
