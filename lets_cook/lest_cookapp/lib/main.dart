//import 'dart:ui';

import 'package:flutter/material.dart';
import './screens/category_screen.dart';
import 'screens/categories_meals_screen.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {

  static final ValueNotifier<ThemeMode> themeNotifier =
    ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ThemeData temalight = ThemeData(
    //   brightness: Brightness.light
    // );

    //   final ThemeData temadark = ThemeData(
    //   brightness: Brightness.dark
    // );
return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'vamos cozinhar?',
      //          copiarcom()
      theme: ThemeData(
        
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.pink[200],
        ),
        fontFamily: 'Raleway',
        canvasColor : const Color.fromRGBO(255,182,193, 1),
        //canvasColor : Color.fromARGB(255, 255, 255, 255),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
          )
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.dark,
          primary: const Color.fromARGB(255, 190, 65, 105),
          secondary: Colors.white,
        ),
        fontFamily: 'Raleway',
        canvasColor : const Color.fromRGBO(145,73,110, 1),
        textTheme: ThemeData.dark().textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
          )
        )
      ),
      themeMode: currentMode,
      home: const CategoriesScreen(),
      //rotas
      routes: {
        '/categories-meals': (ctx) => CategoriesMealsScreens(),
      },
        );
      }
    );
  }
}