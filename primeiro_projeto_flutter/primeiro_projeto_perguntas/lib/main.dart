import 'package:flutter/material.dart';
import './questionario.dart';
import './resutado.dart';
//import './resposta.dart';

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
      'name': '¹ᴾᴼᴺᵀᴼ',
      'texto': 'O que significa "Valar Dohaeris"?',
      'respostas': [
        {'texto': '"Todos os homens devem servir"', 'nota': 10},
        {'texto': 'Todas as pessoas devem sofrer', 'nota': 0},
        {'texto': 'Todas as pessoas devem morrer', 'nota': 0},
        {'texto': 'Todos os homens devem cair', 'nota': 0},
      ]
    },
    {
      'name': '¹ᴾᴼᴺᵀᴼ',
      'texto': 'Quais são os nomes dos 3 dragões de Daenerys Targaryen?',
      'respostas': [
        {'texto': 'Shenlong, Tiamat, Mushun', 'nota': 0},
        {'texto': 'Kall, Tyrell, Dracarys', 'nota': 0},
        {'texto': 'Saphira, Draco, Lestark', 'nota': 0},
        {'texto': 'Rhaegal, Drogon e Viserion', 'nota': 10},
      ]
    },
    {
      'name': '¹ᴾᴼᴺᵀᴼ',
      'texto': 'Quem deu para Jon Snow a espada Garralonga?',
      'respostas': [
        {'texto': 'Ned Stark', 'nota': 0},
        {'texto': 'Tyrion Lannister', 'nota': 0},
        {'texto': 'Jeor Mormont', 'nota': 10},
        {'texto': 'Tormund Giantsbane', 'nota': 0},
      ]
    },
        {
      'name': '¹ᴾᴼᴺᵀᴼ',
      'texto': 'Qual rei ficou conhecido como "Rei Louco"?',
      'respostas': [
        {'texto': 'Rhaegar Targaryen', 'nota': 0},
        {'texto': 'Joffrey Baratheon', 'nota': 0},
        {'texto': 'Aegon IV Targaryen', 'nota': 0},
        {'texto': 'Aerys II Targaryen', 'nota': 10},
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
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_notaTotal, _reiniciarQuestionario),
      ),
    );
  }
}

