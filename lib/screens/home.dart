import 'package:dieta/models/alimento.dart';
import 'package:dieta/models/dieta.dart';
import 'package:dieta/models/refeicao.dart';
import 'package:dieta/screens/editdieta.dart';
import 'package:dieta/screens/editpage.dart';
import 'package:dieta/screens/editrefeicao.dart';
import 'package:dieta/screens/search.dart';
import 'package:dieta/utils/format.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final refeicao = Refeicao();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dieta',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 60,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              size: 20,
            ),
            onPressed: () async {
              final alimento =
                  await Navigator.of(context).push<Alimento>(MaterialPageRoute(
                builder: (context) => const Search(),
              ));
              if (alimento != null) {
                refeicao.add(alimento);
              }
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Alimento>>(
          valueListenable: refeicao,
          builder: (context, lista, child) {
            return Column(
              children: [
                Container(
                  height: 100,
                  width: double.maxFinite,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      '${formatarNumero(refeicao.calorias)} Kcal',
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  color: Colors.grey,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditDieta(refeicao: refeicao),
                          ),
                        );
                      },
                      child: const Text(
                        'Dieta',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  color: Colors.grey,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const EditRefeicao(),
                          ),
                        );
                      },
                      child: const Text(
                        'Refeição',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
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
                        '${alimento.qtd} g | ${alimento.calorias} Kcal | ${alimento.proteina} p | ${alimento.gorduras} g',
                        style: const TextStyle(fontSize: 18),
                      ),
                      onTap: () async {
                        final res = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditPage(alimento: alimento),
                          ),
                        );
                        refeicao.add(res);
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
              ],
            );
          }),
    );
  }
}
