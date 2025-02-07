part of 'get_motel_cubit.dart';

abstract class GetMotelState extends Equatable {
  const GetMotelState();

  @override
  List<Object> get props => [];
}

class GetMotelInitial extends GetMotelState {}

class GetMotelLoading extends GetMotelState {}

class GetMotelError extends GetMotelState {
  const GetMotelError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

class GetMotelSuccess extends GetMotelState {
  const GetMotelSuccess({required this.data});
  final List<MotelEntity> data;

  @override
  List<Object> get props => [data];
}
