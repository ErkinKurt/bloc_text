part of 'bill_cubit.dart';

enum BillStatus { initial, change }

class BillState extends Equatable {
  final BillStatus status;
  final double amount;

  const BillState._({
    this.status = BillStatus.initial,
    this.amount = 20.2,
  });

  const BillState.initial() : this._();

  BillState copyWith({
    BillStatus status,
    double amount,
  }) {
    return BillState._(
      status: status ?? this.status,
      amount: amount ?? this.amount,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [status, amount];
}
