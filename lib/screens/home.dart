import 'package:dieta/models/alimento.dart';
import 'package:dieta/models/refeicao.dart';
import 'package:dieta/screens/refeicaopage.dart';
import 'package:dieta/screens/search.dart';
import 'package:dieta/utils/format.dart';
import 'package:dieta/widget/car_info_nutricional.dart';
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
                CardInfoNutricional(infoNutricional: refeicao),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  color: Colors.white,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RefeicaoPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Refeição',
                        style: TextStyle(
                          fontSize: 44,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
