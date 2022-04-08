import 'package:flutter/material.dart';
import 'recipes.dart';

class Recipe_Detail extends StatefulWidget{
  final Recipe recipe;

  const Recipe_Detail({Key? key, required this.recipe,}) : super (key: key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }

}

class _RecipeDetailState extends State<Recipe_Detail>{

  int sliderval = 1;

  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(title: Text(widget.recipe.label),),

      body: SafeArea(

        child: Column(



          children: <Widget>[


            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.recipe.imageUrl),
              ),
            ),

            const SizedBox(height: 4,),

            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),


            Expanded(child: ListView.builder(
                padding: const EdgeInsets.all(20.0)
              ,itemCount: widget.recipe.ingredients.length,
              itemBuilder: (BuildContext context, int i){
                  final ingredient = widget.recipe.ingredients[i];
                  return Text("${ingredient.Quantity * sliderval} ${ingredient.measure}(s) of ${ingredient.name}");
              }
            )),

            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: "${sliderval*widget.recipe.servings} servings",
              value: sliderval.toDouble(),
              onChanged: (newValue){ setState( () {sliderval=newValue.round();});},
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}