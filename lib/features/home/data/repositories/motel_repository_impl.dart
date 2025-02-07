import 'package:guia_moteis/core/domain/failure/failure.dart';
import 'package:guia_moteis/features/home/data/datasource/motel_datasource.dart';
import 'package:guia_moteis/features/home/data/exceptions/exceptions.dart';
import 'package:guia_moteis/features/home/domain/entities/motel_entity.dart';
import 'package:guia_moteis/features/home/domain/failures/failures.dart';
import 'package:guia_moteis/features/home/domain/repositories/motel_repository.dart';

class MotelRepositoryImpl implements MotelRepository {
  final MotelDataSource _dataSource;

  MotelRepositoryImpl(this._dataSource);

  @override
  Future<(Failure?, List<MotelEntity>?)> getMotel() async {
    try {
      final result = await _dataSource.getMotel();

      return (null, result.data);
    } on GetMotelException catch (error) {
      return (GetMotelFailure(message: error.message), null);
    }
  }
}
