//import 'dart:html';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    // o app não girar na horizontal, mas não vamos usar isso, só de exemplo
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    //Aqui estamos criando uma variável que irá armazenas o nosso tema
    final ThemeData tema = ThemeData();

    return MaterialApp(
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
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              button: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ))),
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
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      //se a data for menor que uma data de 7 dias atras é verdadeiro
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    //aqui ele esta escondendo o modal, logo apos o envio da transação
    Navigator.of(context).pop();
  }

  //Aqui vamos deletar a despesa
  _removeTransaction(String id) {
    setState(() {
      //o removeWhere servira de filtro para remover a lista de acordo com oq passarmos
      _transactions.removeWhere((tr) {
        //nesse caso seria o Id
        return tr.id == id;
      });
    });
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
    //so iremos exibir o grafico se ele estiver no modo paisagem
   bool isLandscape = MediaQuery.of(context).orientation ==  Orientation.landscape;
    //appBar de baixo veio pra cá para alteramos coisas
    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        //vamos fazer com que a fonte possa ser mudada de acordo com
        //o que o usuario quiser e/ou tamanho do celular
        //isso é muito importante para acessibilidade
        style: TextStyle(
          fontSize: 20 * MediaQuery.of(context).textScaleFactor,
        ),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add_circle_outline))
      ],
    );
    //Aqui estartemos fazendo o responsivo, colocando o mediaQuery, subistuindo
    // um heigth unico; como heigth: 400
    final availableHeigth = MediaQuery.of(context).size.height -
        //com isso tiraremos o scrool da aplicação e so deixaremos o scrool para lista
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      //o appbar que estava aqui, foi transferido para cima,
      //para podermos fazer modificações nas resposividades
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Serve para colocar as coisas no centro/Começo/Final ou como nesse caso, esta esticando
          children: <Widget>[
            //exibir grafico
            if(isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Exibir o Grafico?'),
                //habilita o visual de ligar/desligar
                Switch(
                  value: _showChart,
                  onChanged: (value) {
                    setState(() {
                      _showChart = value;
                    });
                  },
                ),
              ],
            ),
            //se o _showChart for verdadeiro exibe esse Sizebox primeiro
            if (_showChart || !isLandscape)
              SizedBox(
                  //aqui no chart da aplicação ele vai pegar o heigth com 30% da tela.
                  //por isso o multiplicado por 3
                  height: availableHeigth * (isLandscape ? 0.7 : 0.3),
                  child: Chart(_recentTransactions)),
            //se for falso exibe esse
            if (!_showChart || !isLandscape )
              SizedBox(
                  //aqui no TransactionList da aplicação ele vai pegar o heigth com 60% da tela.
                  //por isso o multiplicado por 6
                  height: availableHeigth * 0.7,
                  child: TransactionList(_transactions, _removeTransaction)),
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
