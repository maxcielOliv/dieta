import 'package:dieta/models/reativa.dart';
import 'package:dieta/models/refeicao.dart';

class Dieta extends Reativa<Refeicao> {
  static final _instance = Dieta._();

  factory Dieta() => _instance;
  Dieta._();
}
