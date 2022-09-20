import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {

  final DateTime? selectDate;
  final Function (DateTime) onDateChanged;

  const AdaptativeDatePicker({Key? key, 
    required this.selectDate,
    required this.onDateChanged,
  }) : super(key: key);

  //aqui ele vai mostrar um selecionador de datas
  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      //aqui é a data que vem por padrão
      initialDate: DateTime.now(),
      // aqui é a data mais antiga que vc poderia selecionar
      firstDate: DateTime(2019),
      //aqui é a data mais recente que vc pode selecionar
      lastDate: DateTime.now(),
      //aqui vamos ver a data escolhida
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      //se o a data estiver escolhida, ele vai mostrar no lado
      //ele precisa de um setState para atualizar a pag
      onDateChanged(pickedDate);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
          height: 180,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime(2019),
            maximumDate: DateTime.now() ,
            onDateTimeChanged: onDateChanged,
          ),
        )
        : SizedBox(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    selectDate == null
                        //caso o selectDate seja nulo, nenhuma data sera selecionada
                        ? 'Nenhuma data selecionada!'
                        // se tiver selecionada, ele vai aparecer
                        : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectDate!)}',
                  ),
                ),
                TextButton(
                  //ao pressionar ele vai chamar um
                  // selecionador para podermos colocar
                  //a data
                  onPressed: () => _showDatePicker(context),
                  child: const Text(
                    'Selecionar Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
