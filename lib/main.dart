import 'package:flutter/material.dart';
import 'recipes.dart';
import 'Recipe_Detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // 1
  @override
  Widget build(BuildContext context) {
    // 2
    final ThemeData theme = ThemeData();
    // 3
    return MaterialApp(
      // 4
      title: 'Recipe Calculator',
      // 5
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      // 6
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: SafeArea(child: ListView.builder(
        itemCount: Recipe.samples.length,
        itemBuilder: (BuildContext context, int index){

          return GestureDetector(
            // 8
            onTap: () {
              // 9
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    // 10
                    return Recipe_Detail(recipe: Recipe.samples[index]);
                  },
                ),
              );
            },
            // 11
            child: buildRecipeCard(Recipe.samples[index]),
          );

        },
      ),),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      elevation: 30.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)),

      child:

        Padding(padding: const EdgeInsets.all(35.0),

          child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
            const SizedBox(height: 20.0,),
            Text(recipe.label,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
            ),
          ],
        ),
      )
    );
  }
}
