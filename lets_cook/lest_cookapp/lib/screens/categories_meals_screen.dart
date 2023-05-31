import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoriesMealsScreens extends StatelessWidget {

  //essa seria a tela 2 a tela de receitas por categorias! 

  @override
  Widget build(BuildContext context) {
    //aqui ele pega o atributo apartir do ModalRoute pegando o settings arguments                             
//                                        configurações.argumentos 
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(category.title),
      ),
      body: Center(child: Text('Receitas por Categoria ${category.id}')
      ),
    );
  }
}