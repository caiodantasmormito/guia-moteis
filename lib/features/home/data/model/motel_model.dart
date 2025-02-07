import 'package:guia_moteis/features/home/domain/entities/motel_entity.dart';

final class MotelDataModel extends MotelDataEntity {
  const MotelDataModel({required super.data});

  factory MotelDataModel.fromJson(Map<String, dynamic> json) {
    return MotelDataModel(
      data: (json['moteis'] as List)
          .map((motel) => MotelModel.fromJson(motel))
          .toList(),
    );
  }
}

final class MotelModel extends MotelEntity {
  const MotelModel(
      {required super.name,
      required super.logo,
      required super.neighborhood,
      required super.distance,
      required super.qtdFavoritos,
      required super.suites,
      required super.media,
      required super.qtdAvaliacoes});

  factory MotelModel.fromJson(Map<String, dynamic> json) {
    return MotelModel(
      name: json['fantasia'] ?? '',
      logo: json['logo'] ?? '',
      neighborhood: json['bairro'] ?? '',
      distance: json['distancia'].toDouble() ?? 0,
      qtdFavoritos: json['qtdFavoritos'] ?? 0,
      suites: (json['suites'] as List)
          .map((suite) => SuiteModel.fromJson(suite))
          .toList(),
      media: json['media'],
      qtdAvaliacoes: json['qtdAvaliacoes'],
    );
  }
}

class SuiteModel extends SuiteEntity {
  const SuiteModel({
    required super.name,
    required super.qtd,
    required super.exibirQtdDisponiveis,
    required super.photo,
    required super.itens,
    required super.categoryItens,
    required super.period,
  });

  factory SuiteModel.fromJson(Map<String, dynamic> json) {
    return SuiteModel(
      name: json['nome'],
      qtd: json['qtd'],
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'],
      photo: (json['fotos'] as List).map((foto) => foto.toString()).toList(),
      itens: (json['itens'] as List)
          .map((item) => ItemModel.fromJson(item))
          .toList(),
      categoryItens: (json['categoriaItens'] as List)
          .map((categoria) => CategoryModel.fromJson(categoria))
          .toList(),
      period: (json['periodos'] as List)
          .map((periodo) => PeriodModel.fromJson(periodo))
          .toList(),
    );
  }
}

class ItemModel extends ItemEntity {
  const ItemModel({required super.name});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(name: json['nome']);
  }
}

class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.name, required super.icon});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['nome'],
      icon: json['icone'],
    );
  }
}

class PeriodModel extends PeriodEntity {
  const PeriodModel(
      {required super.tempoFormatado,
      required super.time,
      required super.value,
      required super.valueTotal,
      required super.courtesy,
      required super.discount});

  factory PeriodModel.fromJson(Map<String, dynamic> json) {
    return PeriodModel(
      tempoFormatado: json['tempoFormatado'],
      time: json['tempo'],
      value: json['valor'].toDouble(),
      valueTotal: json['valorTotal'].toDouble(),
      courtesy: json['temCortesia'],
      discount: json['desconto'] != null
          ? DiscountModel.fromJson(json['desconto'])
          : null,
    );
  }
}

class DiscountModel extends DiscountEntity {
  const DiscountModel({required super.discount});

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return DiscountModel(discount: json['desconto'].toDouble());
  }
}
