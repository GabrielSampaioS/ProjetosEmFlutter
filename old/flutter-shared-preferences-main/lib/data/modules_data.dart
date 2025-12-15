import 'package:flutter/material.dart';
import '../models/module_item.dart';

List<ModuleItem> appModules(BuildContext context) {
  return [
    ModuleItem(
      title: "Amostras",
      SvgPicturePath: "assets/icons/amostra.svg",
      onTap: () {},
    ),
    ModuleItem(
      title: "Equipamentos",
      SvgPicturePath: "assets/icons/equipamentos.svg",
      onTap: () {},
    ),
    ModuleItem(
      title: "Colunas",
      SvgPicturePath: "assets/icons/colunas.svg",
      onTap: () {},
    ),
    ModuleItem(
      title: "Documentos",
      SvgPicturePath: "assets/icons/documentos.svg",
      onTap: () {},
    ),
    ModuleItem(
      title: "Vidrarias",
      SvgPicturePath: "assets/icons/vidrarias.svg",
      onTap: () {},
    ),
    ModuleItem(
      title: "Padrões",
      SvgPicturePath: "assets/icons/padroes.svg",
      onTap: () {},
    ),
  ];
}
