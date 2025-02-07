import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_moteis/core/domain/usecase/usecase.dart';
import 'package:guia_moteis/features/home/domain/entities/motel_entity.dart';
import 'package:guia_moteis/features/home/domain/usecase/get_motel_usecase.dart';

part 'get_motel_state.dart';

class GetMotelCubit extends Cubit<GetMotelState> {
  final GetMotelUsecase _getMotelUsecase;
  GetMotelCubit({required GetMotelUsecase getMotelUsecase})
      : _getMotelUsecase = getMotelUsecase,
        super(GetMotelInitial());

  Future<void> getMotel() async {
    emit(GetMotelLoading());

    final (failure, result) = await _getMotelUsecase(const NoParams());

    if (result != null) {
      final data = result;
      emit(
        GetMotelSuccess(data: data),
      );
      return;
    }

    emit(GetMotelError(
      message: failure!.message.toString(),
    ));
  }
}
