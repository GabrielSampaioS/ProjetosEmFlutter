import 'package:flutter/material.dart';

class ModuleItem {
  final String title;
  final String SvgPicturePath;
  final Function onTap;

  ModuleItem({
    required this.title,
    required this.SvgPicturePath,
    required this.onTap,
  });
}
