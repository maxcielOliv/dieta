<<<<<<< HEAD
import 'package:app_dieta/models/reativa.dart';
import 'package:app_dieta/models/refeicao.dart';

class Dieta extends Reativa<Refeicao> {
  static final Dieta _instance = Dieta._();

  Dieta._();

  factory Dieta() => _instance;
=======
import 'package:dieta/models/reativa.dart';
import 'package:dieta/models/refeicao.dart';

class Dieta extends Reativa<Refeicao> {
  static final _instance = Dieta._();

  factory Dieta() => _instance;
  Dieta._();
>>>>>>> b187f2442d5186c589f6b45b3a6e3d5e070c6caa
}
