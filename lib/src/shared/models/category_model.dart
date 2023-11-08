import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

// Atributos
class CategoryModel {
  final String id;
  final String title;
  final Color color;

  // Constructor basico
  // Aonde vai ser usado para inicializar
  const CategoryModel({
    required this.id,
    required this.title,
    this.color = AppColors.primary,
  });

  // Constructor nomeado
  // Aonde vai ser usado informações do banco de dados
  CategoryModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        color = map["color"];

  // Aonde vai ser usado para enviar informação para banco de dados
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "color": color,
    };
  }
}
