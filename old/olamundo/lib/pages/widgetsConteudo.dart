import 'package:flutter/material.dart';
import '../widgets/titulosecao.dart';

class WidgetsConteudo extends StatelessWidget {
  const WidgetsConteudo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('conteido')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TitiloSeco(data: 'Trocado por uma class'),

          Text(
            'Segundo elementto',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          Text('apenas txt'),

          Divider(),

          TitiloSeco(data: 'Teste'),
          Image.network('https://picsum.photos/id/237/200/300', height: 240),

          Divider(),

          TitiloSeco(data: 'Icones'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.favorite, color: Colors.red, size: 32),
              Icon(
                Icons.directions_walk_outlined,
                color: Colors.grey,
                size: 32,
              ),
              Icon(Icons.add_home_outlined, color: Colors.blue),
            ],
          ),

          Divider(),

          TitiloSeco(data: 'Elevated button'),
          ElevatedButton(onPressed: () {}, child: Text('Clique em min :D')),
        ],
      ),
    ); // <-- fecha o return
  }
}
