import 'package:flutter/material.dart';

class TitiloSeco extends StatelessWidget {
  final String data;

  const TitiloSeco({
    super.key,
    required this.data,
  }); //Definir um elemento unico na arvore

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }
}
