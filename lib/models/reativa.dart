import 'package:dieta/models/info_nutricional.dart';
import 'package:flutter/material.dart';

abstract class Reativa<T extends InfoNutricional> extends ValueNotifier<List<T>>
    implements InfoNutricional {
  Reativa() : super(<T>[]);

  void add(T item) {
    value.add(item);
    notifyListeners();
  }

  void remove(int indice, T? item) {
    if (item != null) {
      value.remove(value[indice]);
      notifyListeners();
    }
  }

  void trocar(int indice, T? item) {
    if (item != null) {
      if (item.qtd != value[indice].qtd) {
        value[indice] = item;
        notifyListeners();
      }
    }
  }

  @override
  double get calorias => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.calorias;
      });

  @override
  double get carboidrato => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.carboidrato;
      });

  @override
  double? get fibras => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.fibras!;
      });

  @override
  double? get gSaturadas => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.gSaturadas!;
      });

  @override
  double? get gTrans => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.gTrans!;
      });

  @override
  double get gorduras => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.gorduras;
      });

  @override
  double get proteina => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.proteina;
      });

  @override
  double get qtd => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.qtd;
      });

  @override
  double? get sodio => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.sodio!;
      });
}
