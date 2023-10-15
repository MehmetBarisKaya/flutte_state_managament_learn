part of 'peace_cubit_cubit.dart';

sealed class PeaceCubitState extends Equatable {
  const PeaceCubitState();

  @override
  List<Object> get props => [];
}

final class PeaceCubitInitial extends PeaceCubitState {
  final String data;

  PeaceCubitInitial(this.data);
}
