import 'package:guia_moteis/features/home/data/model/motel_model.dart';

abstract interface class MotelDataSource {
  Future<MotelDataModel> getMotel();
}
