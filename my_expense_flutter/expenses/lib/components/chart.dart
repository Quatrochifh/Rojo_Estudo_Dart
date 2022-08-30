//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    //aqui temos a "Lista" dos graficos
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      //aqui ele vai fazer uma soma
      double totalSum = 0.0;

      //aqui ele vai ver se o 'i' é menor que a transação recente
      //se ele tiver no mesmo dia que o weekDay ele pode colocar a transação no mesmo dia
      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        //aqui ele vai pegar o valor das transações e fazer a soma
        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
      //vai colocar o dia mais
      //  atual na direita, listando ela
    }).reversed.toList();
  }

//esa é a soma total da semana que seria o percentage
  double get _WeekTotalValue {
    return groupedTransactions.fold(
      0.0, (sum, tr) {
        return sum + (tr['value'] as double);
      }) ;
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map(
              (tr){
                return Flexible(
                  fit: FlexFit.tight,
                  flex: 23,
                  child: ChartBar(
                    //            como String
                   label: tr['day'] as String ,
                   value: tr['value'] as double, 
                   percentage: _WeekTotalValue == 0 ? 0 : (tr['value'] as double) / _WeekTotalValue,
                  ),
                );
              }).toList(),
          ),
        ));
  }
}
