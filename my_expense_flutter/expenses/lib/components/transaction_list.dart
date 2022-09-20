// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  //setando o onRemove
  final void Function(String) onRemove;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, Constraints) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: Constraints.maxHeight * 0.5,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                //elevation colocará os cards,
                //separando cada despesa
                elevation: 5,
                margin: const EdgeInsets.symmetric(
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
                          'R\$${tr.value}',
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
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  //data do lado do avatar de dinheiro
                  //e baixo do titulo
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 420
                        ? TextButton.icon(
                            onPressed: () => onRemove(tr.id),
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
                          onPressed: () => onRemove(tr.id),
                        ),
                ),
              );
            },
          );
  }
}
