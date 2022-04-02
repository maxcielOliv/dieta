import 'package:dieta/models/refeicao.dart';
import 'package:flutter/material.dart';

class EditDieta extends StatelessWidget {
  final Refeicao refeicao;
  const EditDieta({required this.refeicao, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Refeicao> valor = ValueNotifier(refeicao);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dieta'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(valor.value);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: ValueListenableBuilder<Refeicao>(
        valueListenable: valor,
        builder: (context, lista, child) {
          return ListView.separated(
            itemCount: refeicao.value.length,
            itemBuilder: (context, index) {
              //final re = lista[index];
              return ListTile(
                title: Text('${refeicao.value.single}'),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }
}
