import 'package:flutter/material.dart';
import 'widgetsCicloDeVida.dart';

class CicloStateFulParant extends StatefulWidget {
  const CicloStateFulParant({super.key});

  @override
  State<CicloStateFulParant> createState() => _CicloStateFulParantState();
}

class _CicloStateFulParantState extends State<CicloStateFulParant> {
  Color corAtual = Colors.blue;

  void trocarCor() {
    setState(() {
      corAtual = corAtual == Colors.blue ? Colors.purple : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ciclpo de vida - StateFulget (parant)')),
      body: Column(
        children: [
          Text(
            'Simulando os diferentes estagios do ciclo de vida de um StateFulWidget',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          CicloStateFul(cor: corAtual),

          SizedBox(height: 20),
          ElevatedButton(onPressed: trocarCor, child: Text('Trocar cor')),
        ],
      ),
    );
  }
}
