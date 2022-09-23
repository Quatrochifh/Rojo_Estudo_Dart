import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String) onRemove;

  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Color.fromARGB(255, 250, 170, 164),
    Color.fromARGB(255, 237, 172, 248),
    Color.fromARGB(255, 241, 199, 135),
    Color.fromARGB(255, 141, 194, 236),
    Color.fromARGB(255, 250, 250, 250),
    Color.fromARGB(255, 241, 235, 137),
  ];

  Color ? _backgroundColor;

  @override
  void initState() {
    super.initState();

    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
      return Card(
                color: _backgroundColor,
                //elevation colocará os cards,
                //separando cada despesa
                elevation: 5,
                margin: const  EdgeInsets.symmetric(
                  //aqi temos a margin dos cards
                  // tanto usada na vertical
                  //quanto na horizontal
                  // |
                  vertical: 10,
                  // --
                  horizontal: 24,
                ),
                child: ListTile(
                  //ira virar um circulo
                  //como um circulo de avatar
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    //tamanho do 'raio'circulo
                    radius: 30,
                    child: Padding(
                      //tamanho do texto de dentro
                      padding: const EdgeInsets.all(3),
                      //aqui o FittedBox impede que seus widgets
                      //filhos aumentem de tamanho além de um
                      //determinado limite
                      child: FittedBox(
                        child: Text(
                          'R\$${widget.tr.value}',
                          style: const TextStyle(
                            //cor do texto de dentro
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //texto do lado do avatar de dinheiro
                  //com o titulo
                  title: Text(
                    widget.tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  //data do lado do avatar de dinheiro
                  //e baixo do titulo
                  subtitle: Text(
                    DateFormat('d MMM y').format(widget.tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 420
                        ? TextButton.icon(
                            onPressed: () => widget.onRemove(widget.tr.id),
                            icon: Icon(Icons.delete,
                                color: Theme.of(context).errorColor),
                            label: Text(
                              'Excluir',
                              style: TextStyle(
                                  color: Theme.of(context).errorColor),
                            ),
                          )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => widget.onRemove(widget.tr.id),
                        ),
                ),
              );
  }
}