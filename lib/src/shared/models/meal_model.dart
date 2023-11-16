enum Complexity { simple, medium, difficult }

enum Cost { cheap, fair, expensive }

// Atributos
class MealModel {
  final String id;
  final String title;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final int duration;

  final Complexity complexity;
  final Cost cost;

  final String imgUrl;

  // Constructor basico
  // Aonde vai ser usado para inicializar
  const MealModel({
    required this.id,
    required this.title,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.duration,
    required this.complexity,
    required this.cost,
    required this.imgUrl,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simples';
      case Complexity.medium:
        return 'Medium';
      case Complexity.difficult:
        return 'Dificil';
      default:
        return 'Desconhecida';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return 'Barato';
      case Cost.fair:
        return 'Justo';
      case Cost.expensive:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }
}
