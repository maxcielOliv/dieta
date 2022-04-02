import 'package:dieta/models/info_nutricional.dart';

class Alimento implements InfoNutricional {
  final int? id; // Chave primária do alimeto
  final String nome; // Nome do alimento
  final int categoria; // Chave estrangeira da categoria do alimento
  @override
  final double qtd; // Quantidade em gramas do alimeto
  @override
  final double proteina; // Quantidade em gramas de proteína
  @override
  final double carboidrato; // Quantidade em gramas de carboidrato
  @override
  final double gorduras; // Quantidade em gramas de gordura
  @override
  final double? gSaturadas; // Quantidade em gramas de gordura sturada
  @override
  final double? gTrans; // Quantidade em gramas de gordura trans
  @override
  final double? fibras; // Quantidade em gramas de fibra
  @override
  final double? sodio; // Quantidade em miligramas de sódio
  final DateTime criacao; // Data e hora da criação do registro
  final DateTime? atualizacao; // Data e hora da última atualização do registro

  double get proteinaR => _arredondar(proteina);
  double get carboidratoR => _arredondar(carboidrato);
  double get gorduraR => _arredondar(gorduras);

  @override
  double get calorias {
    final p = proteina == 0 ? 1.0 : proteina;
    final c = carboidrato == 0 ? 1.0 : carboidrato;
    final g = gorduras == 0 ? 1.0 : gorduras;
    return double.parse(((p + c * 4) + (g * 9)).toStringAsFixed(2));
  }

  String get info {
    return 'Pro: ${proteina}g | Car: ${carboidrato}g | Gor: ${gorduras}g';
  }

  Alimento({
    this.id,
    required this.nome,
    this.qtd = 100,
    required this.categoria,
    this.proteina = 0,
    this.carboidrato = 0,
    this.gorduras = 0,
    this.gSaturadas,
    this.gTrans,
    this.fibras,
    this.sodio,
    required this.criacao,
    this.atualizacao,
  });

  Map<String, dynamic> toJson() {
    final res = <String, dynamic>{};
    res.addAll(id != null ? {'id': id} : {});
    res.addAll({
      'nome': nome,
      'qtd': qtd,
      'categoria': categoria,
      'proteina': proteina,
      'carboidrato': carboidrato,
      'gordura': gorduras,
      'g_saturada': gSaturadas,
      'g_trans': gTrans,
      'fibra': fibras,
      'sodio': sodio,
      'criacao': criacao.toIso8601String(),
      'atualizacao': atualizacao?.toIso8601String(),
    });
    return res;
  }

  factory Alimento.fromJson(Map<String, dynamic> json) {
    return Alimento(
      id: json['id'],
      nome: json['nome'],
      qtd: json['qtd'].toDouble(),
      categoria: json['categoria'],
      proteina: json['proteina'].toDouble(),
      carboidrato: json['carboidrato'].toDouble(),
      gorduras: json['gordura'].toDouble(),
      gSaturadas: json['g_saturada']?.toDouble(),
      gTrans: json['g_trans']?.toDouble(),
      fibras: json['fibra']?.toDouble(),
      sodio: json['sodio']?.toDouble(),
      criacao: DateTime.parse(json['criacao']),
      atualizacao: json['atualizacao'] != null
          ? DateTime.parse(json['atualizacao'])
          : null,
    );
  }

  double _arredondar(double valor) {
    return double.parse(valor.toStringAsFixed(2));
  }

  @override
  String toString() {
    return 'ID: ${id ?? '*'} - $nome\nQuantidade: ${qtd}g\nProteina: ${proteina}g\nCarboidrato: ${carboidrato}g\nGordura: ${gorduras}g\ng - Saturada: ${gSaturadas}g\n - Trans: ${gTrans}g\nFibra: ${fibras}g\nSódio: ${sodio}mg\n';
  }

  Alimento copyWith({required double qtd}) {
    return Alimento(
      id: id,
      nome: nome,
      qtd: qtd,
      categoria: categoria,
      proteina: (proteina * qtd) / this.qtd,
      carboidrato: (carboidrato * qtd) / this.qtd,
      gorduras: (gorduras * qtd) / this.qtd,
      gSaturadas: gSaturadas == null ? null : (gSaturadas! * qtd) / this.qtd,
      gTrans: gTrans == null ? null : (gTrans! * qtd) / this.qtd,
      fibras: fibras == null ? null : (fibras! * qtd) / this.qtd,
      sodio: sodio == null ? null : (sodio! * qtd) / this.qtd,
      criacao: criacao,
      atualizacao: atualizacao,
    );
  }
}
