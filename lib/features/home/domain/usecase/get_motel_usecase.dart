import 'package:guia_moteis/core/domain/failure/failure.dart';
import 'package:guia_moteis/core/domain/usecase/usecase.dart';
import 'package:guia_moteis/features/home/domain/entities/motel_entity.dart';
import 'package:guia_moteis/features/home/domain/repositories/motel_repository.dart';

class GetMotelUsecase implements UseCase<List<MotelEntity>, NoParams> {
  final MotelRepository _motelRepository;
  GetMotelUsecase({required MotelRepository motelRepository})
      : _motelRepository = motelRepository;

  @override
  Future<(Failure?, List<MotelEntity>?)> call(NoParams params) =>
      _motelRepository.getMotel();
}
