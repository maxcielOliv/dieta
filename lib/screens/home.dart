import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: teste(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ocorreu um erro!',
                  style: TextStyle(
                    fontSize: 28,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          }
          final teste = snapshot.data!;
          return ListView.separated(
            itemCount: teste.length,
            itemBuilder: (context, index) {
              final lista = teste[index];
              return ListTile(
                title: Text(
                  lista,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }

  Future<String> maxciel() async {
    final res = await http.get(Uri.parse('http://localhost:8080/maxciel'));
    final list = jsonDecode(res.body);
    return list['nome'];
  }
}

Future<List<String>> teste() async {
  final res = await http.get(Uri.parse('http://localhost:8080/maxciel2'));
  final list = jsonDecode(res.body);
  final listafinal = <String>[];
  for (var item in list) {
    final a = item as Map<String, dynamic>;
    listafinal.add(a.values.single);
  }
  return listafinal;
}
