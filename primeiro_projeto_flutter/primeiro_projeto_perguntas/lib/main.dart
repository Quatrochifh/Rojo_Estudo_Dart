import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(const PerguntaApp());

//AULA 55
//Na próxima aula o professor fará um 
//operador ternário na lista de respostas aonde um dos
// valores possíveis é setado como "null". Com a vinda do
// Null Safety no Flutter 2, não é mais possível deixar 
// um valor nulo, logo, vai gerar um erro no código.
// Para corrigir esse problema basta trocar o "null"
// por "[]", ou seja, basta escrever os colchetes vazios 
//no lugar do null, sem as aspas.



class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  // ignore: unused_element
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['preto','vermelho','verde','laranja']
      },
      {
        'texto': 'Qual o seu animal favorito?',
        'respostas': ['Lobo','Leão','Veado','Dragão']
      },
      {'texto': 'Qual a sua casa favorita?',
      'respostas': ['Stark','Lannister','Baratheon','Targaryen']
      }
      
    ];

    List<String> respostas = perguntas[_perguntaSelecionada].cast()['respostas'];
    List<Widget> widgets = respostas
    .map((t) => Resposta(t, _responder))
    .toList();

  //  for (String textoResp in respostas) {
  //     widgets.add(Resposta(textoResp, _responder));
  //   }



    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...widgets, 
          ],
        ),
      ),
    );
  }
}
