import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:endprod/configuracao.dart';
import 'package:endprod/tema/tema_app.dart';
import 'package:endprod/telas/tela_inicio.dart';

class AppEndProd extends StatelessWidget {
  const AppEndProd({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Configuracao()),
      ],
      child: MaterialApp(
        title: 'EndProd',
        theme: TemaApp.tema,
        home: const TelaInicio(),
      ),
    );
  }
}