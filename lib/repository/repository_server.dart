import 'dart:convert';
import 'package:app_dieta/models/alimento.dart';
import 'package:app_dieta/repository/repository.dart';
import 'package:http/http.dart' as http;

class RepositoryServer extends Repository {
  @override
  Future<List<Alimento>> getAlimentos() async {
    final res = await http.get(Uri.parse('http://localhost:8080/alimentos'));
    final list = jsonDecode(res.body);
    final listafinal = <Alimento>[];
    for (var item in list) {
      final alimento = Alimento.fromJson(item);
      listafinal.add(alimento);
    }
    return listafinal;
  }

  @override
  Future<List<Alimento>> getAlimentosFiltrados(String predicado) async {
    final listafinal = <Alimento>[];
    if (predicado.length >= 3) {
      final res = await http.get(
          Uri.parse('http://localhost:8080/alimentosfiltrados/$predicado'));
      final list = jsonDecode(res.body);

      for (var item in list) {
        final alimento = Alimento.fromJson(item);
        listafinal.add(alimento);
      }
    }
    return listafinal;
  }
}
