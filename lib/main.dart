import 'package:flutter/material.dart';
import 'package:tutorial07_listview/database.dart';
import 'package:tutorial07_listview/model/filme_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  final List<Filme> filmes = Database.getFilmes();

  @override

  Widget build(BuildContext contex) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cineflutter"),
          backgroundColor: Colors.blueAccent,
        ),

        body: ListView.builder(
          itemCount: filmes.length,
          itemBuilder: (context, index) {
            final filme = filmes[index];
            return ListTile(
              leading: Icon(
                Icons.movie,
                color: Colors.blue,
              ),
              title: Text(filme.titulo),
              subtitle: Text('Ano: ${filme.anoLancamento}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.stars, color: Colors.amber, size: 18,),
                  Text(filme.imdb.toString()),
                ],
              ),
              onTap: () {
                print('Clicou em: ${filme.titulo}');
              },
            );
          },
        ),
      ),
    );
  }


}
