import 'package:equatable/equatable.dart';

class MotelDataEntity extends Equatable {
  final List<MotelEntity> data;

  const MotelDataEntity({
    required this.data,
  });
  @override
  List<Object?> get props => [
        data,
      ];

  where(bool Function(dynamic element) param0) {}
}

class MotelEntity extends Equatable {
  final String name;
  final String logo;
  final String neighborhood;
  final double distance;
  final int qtdFavoritos;
  final List<SuiteEntity> suites;
  final int qtdAvaliacoes;
  final double media;

  const MotelEntity({
    required this.name,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.qtdFavoritos,
    required this.suites,
    required this.media,
    required this.qtdAvaliacoes,
  });

  @override
  List<Object?> get props => [
        name,
        logo,
        neighborhood,
        distance,
        qtdFavoritos,
        suites,
        media,
        qtdAvaliacoes,
      ];
}

class SuiteEntity extends Equatable {
  final String name;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> photo;
  final List<ItemEntity> itens;
  final List<CategoryEntity> categoryItens;
  final List<PeriodEntity> period;

  const SuiteEntity({
    required this.name,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.photo,
    required this.itens,
    required this.categoryItens,
    required this.period,
  });

  @override
  List<Object?> get props => [
        name,
        qtd,
        exibirQtdDisponiveis,
        photo,
        itens,
        categoryItens,
        period,
      ];
}

class ItemEntity extends Equatable {
  final String name;

  const ItemEntity({required this.name});

  @override
  List<Object?> get props => [
        name,
      ];
}

class CategoryEntity extends Equatable {
  final String name;
  final String icon;

  const CategoryEntity({required this.name, required this.icon});

  @override
  List<Object?> get props => [
        name,
        icon,
      ];
}

class PeriodEntity extends Equatable {
  final String tempoFormatado;
  final String time;
  final double value;
  final double valueTotal;
  final bool courtesy;
  final DiscountEntity? discount;

  const PeriodEntity({
    required this.tempoFormatado,
    required this.time,
    required this.value,
    required this.valueTotal,
    required this.courtesy,
    this.discount,
  });

  @override
  List<Object?> get props => [
        tempoFormatado,
        time,
        value,
        valueTotal,
        courtesy,
        discount,
      ];
}

class DiscountEntity extends Equatable {
  final double discount;

  const DiscountEntity({required this.discount});

  @override
  List<Object?> get props => [
        discount,
      ];
}
