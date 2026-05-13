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
        backgroundColor: const Color.fromARGB(255, 121, 121, 121),
        appBar: AppBar(
          title: 
          Text("Netflix", 
            style: TextStyle(color: Colors.white)),
            centerTitle: true,

          backgroundColor: const Color.fromARGB(255, 168, 1, 1),
        ),

        body: ListView.builder(
          itemCount: filmes.length,
          itemBuilder: (context, index) {
            final filme = filmes[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
              ),
              child: ListTile(leading: Icon(
                Icons.movie,
                color: Colors.blue,
              ),
              title: Text(filme.titulo),
              subtitle: Text('Ano: ${filme.anoLancamento}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.stars, color: filme.imdb< 8 ? Colors.grey : Colors.amber, size: 18,),
                  Text(filme.imdb.toString()),
                ],
              ),
              onTap: () {
                print('Clicou em: ${filme.titulo}');
              },
              ),              
            );
          },
        ),
      ),
    );
  }


}
