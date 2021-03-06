import 'package:dieta/models/alimento.dart';
import 'package:dieta/models/dieta.dart';
import 'package:dieta/models/refeicao.dart';
import 'package:dieta/screens/dietapage.dart';
import 'package:dieta/screens/editrefeicao.dart';
import 'package:dieta/screens/search.dart';
import 'package:flutter/material.dart';

class RefeicaoPage extends StatelessWidget {
  const RefeicaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refeicao = Refeicao();
    final dieta = Dieta();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refeição'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DietaPage(),
                ),
              );
              dieta.add(refeicao);
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Alimento>>(
        valueListenable: refeicao,
        builder: (context, lista, child) {
          return Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  final alimento = lista[index];
                  return ListTile(
                    title: Text(
                      alimento.nome,
                      style: const TextStyle(fontSize: 28),
                    ),
                    subtitle: Text(
                      '${alimento.qtd} g | ${alimento.calorias} Kcal | ${alimento.proteinas} p | ${alimento.gorduras} g',
                      style: const TextStyle(fontSize: 18),
                    ),
                    onTap: () async {
                      final res = await Navigator.of(context).push<Alimento>(
                        MaterialPageRoute(
                          builder: (context) =>
                              EditRefeicao(alimento: alimento),
                        ),
                      );
                      refeicao.trocar(index, res);
                    },
                    trailing: IconButton(
                      onPressed: () async {
                        refeicao.remove(index, alimento);
                      },
                      icon: const Icon(Icons.delete_forever_rounded),
                      color: Colors.red,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(200.0),
                child: ElevatedButton(
                    onPressed: () async {
                      final alimento = await Navigator.of(context)
                          .push<Alimento>(MaterialPageRoute(
                        builder: (context) => const Search(),
                      ));
                      if (alimento != null) {
                        refeicao.add(alimento);
                      }
                    },
                    child: const Text('Adicionar')),
              )
            ],
          );
        },
      ),
    );
  }
}
