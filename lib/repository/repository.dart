import 'package:dieta/models/alimento.dart';

abstract class Repository {
  Future<List<Alimento>> getAlimentos();

  Future<List<Alimento>> getAlimentosFiltrados(String predicado);
}
