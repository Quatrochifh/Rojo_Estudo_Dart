import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitform(){
    //Aqui ele estara mandando o que sera passado
    // pelo usurio(o titulo da despesa e o valor)

    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    //ele fará uma validação, se o titulo estiver vazio ou
    // o valor for menor ou igual a 0
    //não será enviado nada!

    if(title.isEmpty || value <= 0 ){
      return;
    }

    widget.onSubmit(title, value);
                  
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: titleController,
            onSubmitted: (value) => _submitform(),
            decoration: const InputDecoration(
              labelText: 'titulo',
            ),
          ),
          TextField(
            controller: valueController,
            keyboardType: const TextInputType.numberWithOptions(decimal:true),
            onSubmitted: (value) => _submitform(),
            decoration: const InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                  ),
                  onPressed: _submitform,
                  child: const Text('Nova Transação'))
            ],
          )
        ]),
      ),
    );
  }
}
