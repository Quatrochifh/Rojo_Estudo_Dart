import 'package:flutter/cupertino.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  //const Resposta({Key? key}) : super(key: key);

  final String texto;

  final void Function() quandoSelecionado;

  // ignore: use_key_in_widget_constructors
  const Resposta (this.texto, this.quandoSelecionado );


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:  ElevatedButton(
        onPressed: quandoSelecionado,
        child: Text(texto),
        style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 116, 167, 226), // background color
        onPrimary: Colors.black87, 
        ),
    ));
  }
}

//  style: ElevatedButton.styleFrom(
//         primary: const Color.fromARGB(255, 227, 78, 227), // background color
//         onPrimary: Colors.white, 