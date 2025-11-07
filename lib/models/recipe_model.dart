class Recipe {
  final int id;
  final String name;
  final String author;
  final String imageLink;
  final List<String> recipeSteps;

  Recipe({
    required this.id,
    required this.name,
    required this.author,
    required this.imageLink,
    required this.recipeSteps,
  });

  factory Recipe.fromJSON(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      imageLink: json['image_link'],
      recipeSteps: List<String>.from(json['recipe']),
    );
  }

  Map<String, dynamic> toJson() => {
      'id':id,
      'name':name,
      'author':author,
      'image_link':imageLink,
      'recipe':recipeSteps,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Recipe && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

