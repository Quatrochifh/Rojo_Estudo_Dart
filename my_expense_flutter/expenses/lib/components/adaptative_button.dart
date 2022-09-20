// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Adaptativebutton extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  const Adaptativebutton({Key? key, 
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: const Text('sair vermelho '),
            color: Theme.of(context).colorScheme.primary,
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : ElevatedButton(
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.button?.color,
              ),
            ),
            onPressed: onPressed,
          );
  }
}
