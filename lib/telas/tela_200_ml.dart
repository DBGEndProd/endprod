import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:endprod/configuracao.dart';

class Tela200ML extends StatefulWidget {
  const Tela200ML({super.key});

  @override
  State<Tela200ML> createState() => _Tela200MLState();
}

class _Tela200MLState extends State<Tela200ML> {
  final TextEditingController _controladorPaletes = TextEditingController();
  final TextEditingController _controladorPacotes = TextEditingController();
  final TextEditingController _controladorUnidades = TextEditingController();
  int _totalUnidades = 0;

  void _calcularTotal(int pacotesPorPalete) {
    final paletes = int.tryParse(_controladorPaletes.text) ?? 0;
    final pacotes = int.tryParse(_controladorPacotes.text) ?? 0;
    final unidades = int.tryParse(_controladorUnidades.text) ?? 0;

    // 1 pacote = 12 unidades
    final total = (paletes * pacotesPorPalete * 12) + (pacotes * 12) + unidades;

    setState(() {
      _totalUnidades = total;
    });
  }

  @override
  void initState() {
    super.initState();
    final configuracao = Provider.of<Configuracao>(context, listen: false);
    _controladorPaletes.addListener(() => _calcularTotal(configuracao.pacotesPorPalete200ML));
    _controladorPacotes.addListener(() => _calcularTotal(configuracao.pacotesPorPalete200ML));
    _controladorUnidades.addListener(() => _calcularTotal(configuracao.pacotesPorPalete200ML));
  }

  @override
  void dispose() {
    _controladorPaletes.dispose();
    _controladorPacotes.dispose();
    _controladorUnidades.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Configuracao>(
      builder: (context, configuracao, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Calculadora 200 ML'),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _controladorPaletes,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Paletes (1 palete = ${configuracao.pacotesPorPalete200ML} pacotes)',
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _controladorPacotes,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Pacotes (1 pacote = 12 unidades)',
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _controladorUnidades,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Unidades',
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    'Total: $_totalUnidades unidades',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}