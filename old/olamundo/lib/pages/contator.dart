import 'package:flutter/material.dart';

class Contator extends StatefulWidget {
  const Contator({super.key});

  @override
  State<Contator> createState() => _ContatorState();
}

class _ContatorState extends State<Contator> {
  int valor = 0;

  void inclementar() {
    setState(() {
      valor++;
    });
  }

  void deInclementa() {
    setState(() {
      valor--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contator - StateFulWidget')),
      body: Center(
        child: Column(
          children: [
            Text('A soma é $valor', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: inclementar, child: Text('++')),
            ElevatedButton(onPressed: deInclementa, child: Text('--')),
          ],
        ),
      ),
    );
  }
}
