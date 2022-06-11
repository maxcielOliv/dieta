<<<<<<< HEAD
import 'package:app_dieta/models/info_nutricional.dart';
import 'package:flutter/cupertino.dart';
=======
import 'package:dieta/models/info_nutricional.dart';
import 'package:flutter/material.dart';
>>>>>>> b187f2442d5186c589f6b45b3a6e3d5e070c6caa

abstract class Reativa<T extends InfoNutricional> extends ValueNotifier<List<T>>
    implements InfoNutricional {
  Reativa() : super(<T>[]);

<<<<<<< HEAD
  void adicionar(T? item) {
    if (item != null) {
      value.add(item);
      notifyListeners();
    }
  }

  bool remover(T item) {
    if (value.remove(item)) {
      notifyListeners();
      return true;
    } else {
      return false;
=======
  void add(T item) {
    value.add(item);
    notifyListeners();
  }

  void remove(int indice, T? item) {
    if (item != null) {
      value.remove(value[indice]);
      notifyListeners();
>>>>>>> b187f2442d5186c589f6b45b3a6e3d5e070c6caa
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
<<<<<<< HEAD
  double get calorias {
    double total = 0;
    for (final item in value) {
      total += item.calorias;
    }
    return total;
  }

  @override
  double get carboidratos {
    double total = 0;
    for (final item in value) {
      total += item.carboidratos;
    }
    return total;
  }

  @override
  double? get fibras {
    double total = 0;
    for (final item in value) {
      total += item.fibras ?? 0;
    }
    return total;
  }

  @override
  double? get gSaturadas {
    double total = 0;
    for (final item in value) {
      total += item.gSaturadas ?? 0;
    }
    return total;
  }

  @override
  double? get gTrans {
    double total = 0;
    for (final item in value) {
      total += item.gTrans ?? 0;
    }
    return total;
  }

  @override
  double get gorduras {
    double total = 0;
    for (final item in value) {
      total += item.gorduras;
    }
    return total;
  }

  @override
  double get proteinas {
    double total = 0;
    for (final item in value) {
      total += item.proteinas;
    }
    return total;
  }

  @override
  double get qtd {
    double total = 0;
    for (final item in value) {
      total += item.qtd;
    }
    return total;
  }

  @override
  double? get sodio {
    double total = 0;
    for (final item in value) {
      total += item.sodio ?? 0;
    }
    return total;
  }
=======
  double get calorias => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.calorias;
      });

  @override
  double get carboidratos => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.carboidratos;
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
  double get proteinas => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.proteinas;
      });

  @override
  double get qtd => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.qtd;
      });

  @override
  double? get sodio => value.fold<double>(0.0, (soma, alimento) {
        return soma += alimento.sodio!;
      });
>>>>>>> b187f2442d5186c589f6b45b3a6e3d5e070c6caa
}
