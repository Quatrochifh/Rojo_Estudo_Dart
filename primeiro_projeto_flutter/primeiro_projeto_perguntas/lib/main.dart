import 'package:flutter/material.dart';
import './questionario.dart';
import './resutado.dart';

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _notaTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'preto', 'nota': 10},
        {'texto': 'vermelho', 'nota': 9},
        {'texto': 'verde', 'nota': 8},
        {'texto': 'laranja', 'nota': 7},
      ]
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Lobo', 'nota': 10},
        {'texto': 'Leão', 'nota': 9},
        {'texto': 'Veado', 'nota': 8},
        {'texto': 'Dragão', 'nota': 7},
      ]
    },
    {
      'texto': 'Qual a sua casa favorita?',
      'respostas': [
        {'texto': 'Stark', 'nota': 10},
        {'texto': 'Lannister', 'nota': 9},
        {'texto': 'Baratheon', 'nota': 8},
        {'texto': 'Targaryen', 'nota': 10},
      ]
    }
  ];

// return Resposta(
//             resp['texto'].toString(),
//             () => quandoResponder(int.parse(resp['pontuacao'].toString())),
//           );


  // ignore: unused_element
  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _notaTotal += nota;
      });
    }

    print(_notaTotal);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // List<String> respostas = temPerguntaSelecionada
    // ? _perguntas[_perguntaSelecionada].cast()['respostas']
    // : [];
    // List<Widget> widgets =
    //     respostas.map((t) => Resposta(t, _responder)).toList();

    //  for (String textoResp in respostas) {
    //     widgets.add(Resposta(textoResp, _responder));
    //   }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            :  Resultado(_notaTotal),
      ),
    );
  }
}
