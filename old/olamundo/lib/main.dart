import 'package:flutter/material.dart';
import 'pages/widgetsConteudo.dart';
import 'pages/widgeysLayout.dart';
import 'pages/widgetsCicloDeVidaParant.dart';
import 'pages/contator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListContents(),
    ); // <-- fecha o MaterialApp
  }
}

class ListContents extends StatelessWidget {
  final List<CatalogoItem> secoes = [
    CatalogoItem(
      titulo: 'Widgets de Conteudo',
      icone: Icons.text_fields,
      descricao: 'Exemplo de Widgets bsico',
      destino: WidgetsConteudo(),
    ),
    CatalogoItem(
      titulo: 'Widgets de Layout',
      icone: Icons.view_agenda,
      descricao: 'Exemplo de Widgetss de descricao para estudo',
      destino: WidgetsLayout(),
    ),
    CatalogoItem(
      titulo: 'Ciclo de vida dos Widget',
      icone: Icons.sync,
      descricao: 'Entendendo o cliclo de vida de um StateFulWidget',
      destino: CicloStateFulParant(),
    ),
    CatalogoItem(
      titulo: 'Contator - setState',
      icone: Icons.refresh_outlined,
      descricao:
          'Exemplo de contator utilizando o setState e gerenciamento de estados',
      destino: Contator(),
    ),
  ];
  ListContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('catalogo de Estudo')),

      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 1,
        childAspectRatio: 0.9,
        children: secoes
            .map(
              (item) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item.destino),
                ),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(item.icone, size: 48, color: Colors.blue),
                        Text(
                          item.titulo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          item.descricao,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class CatalogoItem {
  final String titulo;
  final IconData icone;
  final String descricao;
  final Widget destino;

  CatalogoItem({
    required this.titulo,
    required this.icone,
    required this.descricao,
    required this.destino,
  });
}
