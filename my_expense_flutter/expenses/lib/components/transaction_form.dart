import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  _submitform(){
    
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 1;

    if(title.isEmpty || value <= 0 ){
      return;
    }

    onSubmit(title, value);
                  
  }

   TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

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
