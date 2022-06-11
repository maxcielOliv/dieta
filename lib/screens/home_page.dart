import 'package:app_dieta/models/dieta.dart';
import 'package:app_dieta/models/refeicao.dart';
import 'package:app_dieta/screens/editar_refeicao.dart';
import 'package:flutter/material.dart';

import '../utils/helper.dart';
import '../widget/car_info_nutricional.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dieta = Dieta();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Dieta'),
      ),
      body: ValueListenableBuilder<List<Refeicao>>(
        valueListenable: dieta,
        builder: (context, refeicoes, child) {
          return Column(
            children: [
              CardInfoNutricional(infoNutricional: dieta),
              ReorderableListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                shrinkWrap: true,
                itemCount: refeicoes.length,
                itemBuilder: (context, index) {
                  final refeicao = refeicoes[index];
                  return ListTile(
                    key: Key('$index'),
                    tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    title: Text(
                      '${index + 1} ${refeicao.nome} | Itens: ${refeicao.value.length}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    subtitle: Text(
                      '${formatarNumero(refeicao.qtd)} g | P: ${formatarNumero(refeicao.proteinas)} | C: ${refeicao.carboidratos} | G: ${formatarNumero(refeicao.gorduras)} | ${formatarNumero(refeicao.calorias)} Kcal',
                      style: const TextStyle(fontSize: 18),
                    ),
                    onTap: () async {
                      // aguarda o novo valor do alimento
                      final res = await Navigator.of(context).push<Refeicao>(
                        MaterialPageRoute(
                            builder: (context) =>
                                EditarRefeicao(refeicao: refeicao.copyWith())),
                      );
                      // Troca o alimento com base no indice
                      dieta.trocar(index, res);
                    },
                    trailing: IconButton(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      icon: const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.redAccent,
                      ),
                      iconSize: 28,
                      onPressed: () {
                        dieta.remover(refeicao);
                      },
                    ),
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  final _refeicao = refeicoes;
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final lista = _refeicao.removeAt(oldIndex);
                  _refeicao.insert(newIndex, lista);
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () async {
          final res = await Navigator.of(context).push<Refeicao>(
            MaterialPageRoute(builder: (context) => const EditarRefeicao()),
          );
          dieta.adicionar(res);
        },
      ),
    );
  }
}
