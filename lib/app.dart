import 'package:flutter/material.dart';
import 'package:endprod/tema/tema_app.dart';
import 'package:endprod/telas/tela_inicio.dart';

class AppEndProd extends StatelessWidget {
  const AppEndProd({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DBG EndProd',
      theme: TemaApp.tema,
      home: const TelaInicio(),
    );
  }
}