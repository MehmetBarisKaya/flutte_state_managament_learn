part of 'peace_bloc_bloc.dart';

sealed class PeaceBlocState extends Equatable {
  const PeaceBlocState();
  
  @override
  List<Object> get props => [];
}

final class PeaceBlocInitial extends PeaceBlocState {}
