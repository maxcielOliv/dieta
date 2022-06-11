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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              size: 38,
            ),
            onPressed: () {
              Navigator.of(context).pop(valor.value);
            },
          ),
        ],
      ),
      body: Column(),
    );
  }
}
