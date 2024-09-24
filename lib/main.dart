import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class Recipe {
  final String title;
  final List<String> ingredients;
  final String preparation;

  Recipe(this.title, this.ingredients, this.preparation);
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      'Spaghetti',
      ['200g spaghetti', '2 cups tomato sauce', 'Salt and pepper to taste', 'Parmesan cheese'],
      '1. Boil water and cook spaghetti until al dente. 2. Heat the tomato sauce in a pan. 3. Drain spaghetti and mix with sauce. 4. Serve with Parmesan cheese.',
    ),
    Recipe(
      'Tacos',
      ['Soft or hard taco shells', '500g ground beef', '1 packet taco seasoning', 'Lettuce', 'Tomatoes', 'Cheese'],
      '1. Cook ground beef in a pan until browned. 2. Add taco seasoning and water, cook until thick. 3. Fill taco shells with beef, lettuce, tomatoes, and cheese.',
    ),
    Recipe(
      'Salad',
      ['Mixed greens', 'Cherry tomatoes', 'Cucumber', 'Olive oil', 'Balsamic vinegar', 'Salt and pepper'],
      '1. In a bowl, combine mixed greens, chopped tomatoes, and cucumber. 2. Drizzle with olive oil and balsamic vinegar. 3. Toss and season with salt and pepper.',
    ),
    Recipe(
      'Pancakes',
      ['1 cup flour', '2 tablespoons sugar', '1 tablespoon baking powder', '1 cup milk', '1 egg', 'Butter for frying'],
      '1. Mix flour, sugar, and baking powder in a bowl. 2. In another bowl, whisk milk and egg together. 3. Combine wet and dry ingredients, stir until smooth. 4. Heat butter in a pan and pour batter to form pancakes. Cook until golden brown on both sides.',
    ),
    Recipe(
      'Fried Rice',
      ['2 cups cooked rice', '1 cup mixed vegetables', '2 eggs', '3 tablespoons soy sauce', 'Green onions', 'Oil for frying'],
      '1. Heat oil in a pan and scramble the eggs, then set aside. 2. Stir-fry mixed vegetables in the same pan. 3. Add cooked rice and soy sauce, stir well. 4. Mix in scrambled eggs and chopped green onions.',
    ),
    Recipe(
      'Chicken Curry',
      ['500g chicken, cut into pieces', '2 onions, chopped', '2 tomatoes, chopped', '1 can coconut milk', '2 tablespoons curry powder', 'Salt to taste'],
      '1. Sauté onions in a pot until golden. 2. Add chicken pieces and cook until browned. 3. Stir in tomatoes, coconut milk, and curry powder. 4. Simmer until chicken is cooked through. Season with salt to taste.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(recipe: recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  DetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...recipe.ingredients.map((ingredient) => Text('• $ingredient')).toList(),
            SizedBox(height: 16.0),
            Text('Preparation:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(recipe.preparation),
          ],
        ),
      ),
    );
  }
}
