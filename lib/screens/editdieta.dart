import 'package:dieta/models/dieta.dart';
import 'package:dieta/models/refeicao.dart';
import 'package:dieta/screens/editrefeicao.dart';
import 'package:dieta/utils/format.dart';
import 'package:flutter/material.dart';

class EditDieta extends StatelessWidget {
  const EditDieta({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dieta = Dieta();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dieta'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditRefeicao(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ValueListenableBuilder<List<Refeicao>>(
        valueListenable: dieta,
        builder: (context, lista, child) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: lista.length,
            itemBuilder: (context, index) {
              final refeicao = lista[index];
              return ListTile(
                title: const Text('Refeição'),
                subtitle: Text(
                  '${formatarNumero(refeicao.qtd)} g | P: ${formatarNumero(refeicao.proteina)} | C: ${refeicao.carboidrato} | G: ${refeicao.gorduras} | ${refeicao.calorias} Kcal',
                ),
                trailing: IconButton(
                  onPressed: () async {
                    dieta.remove(index, refeicao);
                  },
                  icon: const Icon(Icons.delete_forever_rounded),
                  color: Colors.red,
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }
}
