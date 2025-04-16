import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:endprod/configuracao.dart';

class TelaConfiguracoes extends StatefulWidget {
  const TelaConfiguracoes({super.key});

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  final TextEditingController _controlador2Litros = TextEditingController();
  final TextEditingController _controlador350ML = TextEditingController();
  final TextEditingController _controlador250ML = TextEditingController();
  final TextEditingController _controlador200ML = TextEditingController();

  @override
  void initState() {
    super.initState();
    final configuracao = Provider.of<Configuracao>(context, listen: false);
    _controlador2Litros.text = configuracao.pacotesPorPalete2Litros.toString();
    _controlador350ML.text = configuracao.pacotesPorPalete350ML.toString();
    _controlador250ML.text = configuracao.pacotesPorPalete250ML.toString();
    _controlador200ML.text = configuracao.pacotesPorPalete200ML.toString();
  }

  @override
  void dispose() {
    _controlador2Litros.dispose();
    _controlador350ML.dispose();
    _controlador250ML.dispose();
    _controlador200ML.dispose();
    super.dispose();
  }

  void _salvarConfiguracoes(BuildContext context) {
    final configuracao = Provider.of<Configuracao>(context, listen: false);
    configuracao.setPacotesPorPalete2Litros(int.parse(_controlador2Litros.text));
    configuracao.setPacotesPorPalete350ML(int.parse(_controlador350ML.text));
    configuracao.setPacotesPorPalete250ML(int.parse(_controlador250ML.text));
    configuracao.setPacotesPorPalete200ML(int.parse(_controlador200ML.text));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pacotes por Palete',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controlador2Litros,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '2 Litros',
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controlador350ML,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '350 ML',
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controlador250ML,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '250 ML',
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controlador200ML,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '200 ML',
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () => _salvarConfiguracoes(context),
                child: const Text('Salvar', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}