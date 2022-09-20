//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';


class ChartBar extends StatelessWidget {
  //const ChartBar({Key? key, required this.label, required this.value, required this.percentage}) : super(key: key);

  final String label;
  final double value;
  final double percentage;

  const ChartBar(
      {Key? key, required this.label, required this.value, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // ignore: non_constant_identifier_names
      builder: (ctx, Constraints) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: Constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(value.toStringAsFixed(2))),
            ),
            SizedBox(height: Constraints.maxHeight * 0.05),
            SizedBox(
              height: Constraints.maxHeight * 0.6,
              width: 10,
              //o stack permite colocar
              // um componente sobreposta a outra
              child: Stack(
                //vai mudar a posição da barra,
                //fazendo ela começar de baixo para cima
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  //container que ira definir a
                  //estrutura da nossa barra
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        color: const Color.fromRGBO(152, 251, 152, 2),
                        //arrendondara as pontas do grafico
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Constraints.maxHeight * 0.05),
            SizedBox(
              height: Constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            )
          ],
        );
      },
    );
  }
}
