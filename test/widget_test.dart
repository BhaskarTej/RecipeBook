import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipebook/main.dart'; // Ensure this path is correct based on your project structure

void main() {
  testWidgets('Recipe app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(RecipeApp());

    // Verify that our home screen displays the list of recipes.
    expect(find.text('Favorite Recipes'), findsOneWidget);
    expect(find.text('Spaghetti'), findsOneWidget);
    expect(find.text('Tacos'), findsOneWidget);
    expect(find.text('Salad'), findsOneWidget);

    // Tap on the Spaghetti recipe and trigger a frame.
    await tester.tap(find.text('Spaghetti'));
    await tester.pumpAndSettle(); // Wait for the navigation animation to complete.

    // Verify that we are now on the details screen.
    expect(find.text('Spaghetti'), findsOneWidget); // Check if the title is present.
    expect(find.text('Delicious spaghetti with tomato sauce.'), findsOneWidget); // Check if the description is displayed.
  });
}
