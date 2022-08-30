//import 'dart:html';

import 'dart:math';

import 'package:flutter/material.dart';
import './models/transaction.dart';
//import './components/transaction_user.dart';
import './components/transaction_form.dart';
import './components/transaction_list.dart';
import './components/chart.dart';

//VERSÃO DO EXPENSES APP NA 1.O

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Aqui estamos criando uma variável que irá armazenas o nosso tema
    final ThemeData tema = ThemeData();


    return  MaterialApp(
      home: const MyHomePage(),
      //aqui iremos referenciar o theme do materialApp
      //o copy.With Este método pega todas as propriedades (que precisam ser alteradas)
      // e seus valores correspondentes e retorna um novo objeto com as propriedades desejadas.
      theme: tema.copyWith(
        //o colorScheme é o esquema de cores, ou seja ele ira fazer o esquema de cores desejado
        colorScheme: tema.colorScheme.copyWith(
          //cor primaria
          primary: Colors.green,
          //cor secundaria 
          secondary: Colors.green[800],
          
        ),
        //tema do texto
        textTheme: tema.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize:15,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle:  TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )
        )
      ) ,
    );
  }
}
 
//

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction>_transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
        Transaction(
      id: 't3',
      title: 'Conta de agua',
      value:111111.30,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
        Transaction(
      id: 't4',
      title: 'Conta de carta',
      value: 21.30,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr){
      //se a data for menor que uma data de 7 dias atras é verdadeiro
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList( );
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    //aqui ele esta escondendo o modal, logo apos o envio da transação
    Navigator.of(context).pop();
  }

    //aqui abriremos o modal 
   _openTransactionFormModal(BuildContext context) {
    //adcionaremos a conta
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: const Icon(Icons.add_circle_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Serve para colocar as coisas no centro/Começo/Final ou como nesse caso, esta esticando
          children: <Widget>[
           Chart(_recentTransactions),  
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
