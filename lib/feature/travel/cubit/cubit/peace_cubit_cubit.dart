import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'peace_cubit_state.dart';

class PeaceCubitCubit extends Cubit<PeaceCubitState> {
  PeaceCubitCubit() : super(PeaceCubitInitial("a"));
}
