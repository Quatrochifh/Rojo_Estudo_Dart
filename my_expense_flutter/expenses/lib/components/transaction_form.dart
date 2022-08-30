import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  //data ja vem selecionada como padrão
  DateTime? _selectDate = DateTime.now();

  _submitform() {
    //Aqui ele estara mandando o que sera passado
    // pelo usurio(o titulo da despesa e o valor)

    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    //ele fará uma validação, se o titulo estiver vazio ou
    // o valor for menor ou igual a 0
    //não será enviado nada!

    if (title.isEmpty || value <= 0 ||_selectDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectDate!);
  }

  //aqui ele vai mostrar um selecionador de datas
  _showDatePicker(){
    showDatePicker(
      context: context,
      //aqui é a data que vem por padrão
       initialDate: DateTime.now(), 
       // aqui é a data mais antiga que vc poderia selecionar
       firstDate: DateTime(2022), 
       //aqui é a data mais recente que vc pode selecionar
       lastDate: DateTime.now(),
       //aqui vamos ver a data escolhida 
    ).then((pickedDate){
      if(pickedDate == null) {
        return;
      }
      //se o a data estiver escolhida, ele vai mostrar no lado
      //ele precisa de um setState para atualizar a pag
    setState(() {
      _selectDate = pickedDate;
    });
      //print('executado dentro do then');
    });
    //print('Executado!!!');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: _titleController,
            onSubmitted: (value) => _submitform(),
            decoration: const InputDecoration(
              labelText: 'titulo do produto',
            ),
          ),
          TextField(
            controller: _valueController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (value) => _submitform(),
            decoration: const InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: <Widget>[
                 Expanded(
                   child: Text(
                   _selectDate == null
                            //caso o selectDate seja nulo, nenhuma data sera selecionada
                            ? 'Nenhuma data selecionada!'
                            // se tiver selecionada, ele vai aparecer
                            : 'Data Selecionada: ${DateFormat('dd/MM/y')
                            .format(_selectDate!)}',
                    ),
                 ),
                TextButton(
                  //ao pressionar ele vai chamar um
                  // selecionador para podermos colocar 
                  //a data
                  onPressed: _showDatePicker,
                  child: const Text(
                    'Selecionar Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    //onPrimary: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: _submitform,
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.button?.color,
                    ),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
