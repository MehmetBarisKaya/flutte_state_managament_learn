import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'peace_bloc_event.dart';
part 'peace_bloc_state.dart';

class PeaceBlocBloc extends Bloc<PeaceBlocEvent, PeaceBlocState> {
  PeaceBlocBloc() : super(PeaceBlocInitial()) {
    on<PeaceBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
