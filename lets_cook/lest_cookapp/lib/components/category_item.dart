import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {Key? key}) : super(key: key);

 //vamo mudar de telaa
 //fazendo uma chamada para rotas nomeaveis
  void _selectCategory(BuildContext context){
      Navigator.of(context).pushNamed(
        '/categories-meals',
         arguments: category
    );
  }

  //Esse é o item de categoria, a parte de baixo com varias cores

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //faz um "splash" na cor ao clicada
      splashColor: Theme.of(context).colorScheme.primary,
      //vai mudar pra outra tela, nesse caso pra _selectCategory
      onTap: () => _selectCategory(context),
      //Isso faz com que ao pressionar o botão não mude de forma
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          // ignore: sort_child_properties_last
          child: Text(
            category.title.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [
                  //opacidade de um lado
                  category.color.withOpacity(0.5),
                  //sem opacidade
                  category.color,
                ],
                //jeito da opacidade, aqui começando da esquerda e terminando na direita
                //ou seja, na esquerda opacidade como la em cima withOpacity esta (0.5)
                //e na direita sem, pois só esta o categoty.color
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          )),
    );
  }
}
