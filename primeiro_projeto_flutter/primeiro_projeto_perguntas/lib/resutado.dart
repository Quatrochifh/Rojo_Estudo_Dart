//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  const Resultado(this.pontuacao, {Key? key}) : super(key: key);

  String get fraseResultado {
    if (pontuacao <= 23 ) {
      return 'Você esta ficando importante!';
    } else if (pontuacao <= 26) {
      return 'Você é um lorde!';
    } else if (pontuacao <= 29) {
      return 'Você é o mão do rei!';
    } else {
      return 'Você é um rei!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fraseResultado,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
