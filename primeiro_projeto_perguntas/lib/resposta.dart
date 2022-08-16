//import 'package:flutter/cupertino.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  //const Resposta({Key? key}) : super(key: key);

  final String texto;

 final void Function() quandoSelecionado;

  const Resposta(this.texto,  this.quandoSelecionado, {Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:  ElevatedButton(
        onPressed: quandoSelecionado,
        style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 11, 165, 34), // background color
        onPrimary: Colors.white, 
        ),
        child:  Text(texto),
    ));
  }
}

//  style: ElevatedButton.styleFrom(
//         primary: const Color.fromARGB(255, 227, 78, 227), // background color
//         onPrimary: Colors.white, 