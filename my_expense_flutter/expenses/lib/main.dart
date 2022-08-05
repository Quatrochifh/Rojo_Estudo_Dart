//import 'dart:html';

import 'package:flutter/material.dart';
import './models/transaction.dart';
import './components/transaction_user.dart';


//VERSÃO DO EXPENSES APP NA 1.O

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: MyHomePage(),
    ); 
  }
}

//class Transaction {
//final String id;
// final String title;
// final double value;
//final DateTime date;

//Transaction({
//  required this.id,
//  required this.title,
//  required this.value,
//  required this.date,
// });
//}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

   final titleController = TextEditingController();
   final valueController = TextEditingController();

  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas Pessoais'),
          actions: <Widget> [
            IconButton(
            onPressed: () {},
            icon: const Icon(Icons. add_circle_outline)
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Serve para colocar as coisas no centro/Começo/Final ou como nesse caso, esta esticando
            children: <Widget>[
              // ignore: sized_box_for_whitespace
              Container(
                width: double.infinity,
                child: const Card(
                  color: Colors.blue,
                  elevation: 9,
                  child: Text('GRAFÍCO'),
                ),
              ),
              const TransactionUser(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}
