import 'dart:developer';

import 'package:dieta/models/alimento.dart';
import 'package:dieta/repository/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RepositorySupa extends Repository {
  @override
  Future<List<Alimento>> getAlimentos() async {
    final alimentos = <Alimento>[];
    final res =
        await Supabase.instance.client.from('alimentos').select().execute();
    if (res.error != null) {
      log(
        'Erro na consulta',
        name: 'App Dieta',
        error: res.error,
      );
    } else {
      final data = res.data as List;
      for (var item in data) {
        alimentos.add(Alimento.fromJson(item));
      }
    }
    return alimentos;
  }

  @override
  Future<List<Alimento>> getAlimentosFiltrados(String predicado) async {
    final alimentos = <Alimento>[];
    if (predicado.length >= 3) {
      final res = await Supabase.instance.client
          .rpc('search', params: {'value': '%$predicado%'}).execute();
      if (res.error != null) {
        log(
          'Erro na consulta',
          name: 'App Dieta',
          error: res.error,
        );
      } else {
        final data = res.data as List;
        for (var item in data) {
          alimentos.add(Alimento.fromJson(item));
        }
      }
    }
    return alimentos;
  }
}
