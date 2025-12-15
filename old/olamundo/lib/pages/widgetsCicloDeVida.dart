import 'package:flutter/material.dart';

class CicloStateFul extends StatefulWidget {
  final Color cor;
  const CicloStateFul({super.key, required this.cor});

  @override
  State<CicloStateFul> createState() => _CicloStateFul();
}

class _CicloStateFul extends State<CicloStateFul> {
  @override
  void initState() {
    super.initState();
    print('initStade: Widget foi inserido na árvore');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(
      'didChangeDependencies: Widget recebeu dependencia / mudanças no context da árvore',
    );
  }

  @override
  void didUpdateWidget(CicloStateFul oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget: Propriedades alteradas');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose: Widget removido da árvore');
  }

  @override
  Widget build(BuildContext context) {
    print('Widget construido / recostruido');
    return Container(
      width: 200,
      height: 200,
      color: widget.cor,
      child: Center(
        child: Text('Cor atua', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
