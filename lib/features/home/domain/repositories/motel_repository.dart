import 'package:guia_moteis/features/home/domain/entities/motel_entity.dart';

import '../../../../core/domain/failure/failure.dart';

abstract interface class MotelRepository {
  Future<(Failure?, List<MotelEntity>?)> getMotel();
}
