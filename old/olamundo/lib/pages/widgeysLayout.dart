import 'package:flutter/material.dart';
import 'package:olamundo/widgets/titulosecao.dart';

class WidgetsLayout extends StatelessWidget {
  const WidgetsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widgets de layout')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TitiloSeco(data: 'Paadding'),
          Container(
            color: Colors.yellow,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('Texto com interno interno ded 20px'),
            ),
          ),

          Divider(),

          TitiloSeco(data: 'Alling'),

          Container(
            height: 80,
            color: Colors.yellow,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text('Alinhmento de texto'),
            ),
          ),

          Divider(),
          TitiloSeco(data: 'Center'),
          Container(
            height: 80,
            color: Colors.yellow,
            child: Center(child: Text('Center')),
          ),

          Divider(),
          TitiloSeco(data: 'SizeBox'),
          Column(
            children: [
              Text('Texto acima'),
              SizedBox(height: 20),
              Text('Texto abaixo'),
            ],
          ),

          Divider(),
          TitiloSeco(data: 'Expanded e flexible (em coluna)'),

          Container(
            height: 200,
            color: Colors.yellow,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Center(child: Text("Expanded ")),
                  ),
                ),

                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.pink,
                    child: Center(child: Text('Flexible (flex = 2)')),
                  ),
                ),
              ],
            ),
          ),

          Divider(),
          TitiloSeco(data: 'Expanded e flexible (em row)'),

          Container(
            /*height: 200,*/
            color: Colors.yellow,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Center(child: Text('Expanded in row')),
                  ),
                ),

                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.pink,
                    child: Center(child: Text('Flexible (flex = 2)')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
