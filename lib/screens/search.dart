import 'package:dieta/models/alimento.dart';
import 'package:dieta/repository/repository.dart';
import 'package:dieta/repository/repository_supa.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();
  final _focus = FocusNode();
  final Repository _repository = RepositorySupa();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        title: TextField(
          focusNode: _focus,
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Pesquisar',
          ),
          onChanged: (value) {
            if (value.length >= 3) {
              setState(() {});
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel_rounded),
            onPressed: () {
              if (_controller.text.isEmpty) {
                Navigator.pop(context);
              } else {
                _controller.text = '';
                _focus.requestFocus();
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Alimento>>(
          future: _repository.getAlimentosFiltrados(_controller.text),
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
            final listaAlimentos = snapshot.data!;
            if (listaAlimentos.isEmpty && _controller.text.length >= 3) {
              return const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Nenhum resultado!',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: listaAlimentos.length,
              itemBuilder: (context, index) {
                final alimento = listaAlimentos[index];
                return ListTile(
                  title: Text(alimento.nome),
                  subtitle: Text(alimento.info),
                );
              },
            );
          }),
    );
  }
}