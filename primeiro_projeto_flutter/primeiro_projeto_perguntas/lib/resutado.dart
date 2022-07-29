//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario, {Key? key})
      : super(key: key);


  // const Resultado(this.pontuacao, void Function() reiniciarQuestionario,
  // {Key? key, required this.quandoReiniciarQuestionario}) 
  //: super(key: key);

  String get fraseResultado {
    if (pontuacao <= 0 ) {
      return 'O que foi isso?!! Achava que você sabia das coisas! Sua nota foi: ${pontuacao}';
  } else if (pontuacao <= 10 ) {
      return 'Você esta ficando importante! Sua nota foi: ${pontuacao}';
    } else if (pontuacao <= 20) {
      return 'Você é um lorde! Sua nota foi: ${pontuacao}';
    } else if (pontuacao <= 30) {
      return 'Você é o mão do rei! Sua nota foi: ${pontuacao}';
    } else {
      return 'Você é um rei! Sua nota foi: ${pontuacao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center ,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
         TextButton (
         // ignore: sort_child_properties_last
         child: const Text(
          'Reiniciar??',
          style: TextStyle(fontSize: 19),
          ),
         style: TextButton.styleFrom(
          primary: Colors.blue,
         ),
         onPressed: quandoReiniciarQuestionario,
         )
      ],
    );
  }
}
