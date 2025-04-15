import 'package:flutter/material.dart';

class TelaDoisLitros extends StatefulWidget {
  const TelaDoisLitros({super.key});

  @override
  State<TelaDoisLitros> createState() => _TelaDoisLitrosState();
}

class _TelaDoisLitrosState extends State<TelaDoisLitros> {
  final TextEditingController _controladorPaletes = TextEditingController();
  final TextEditingController _controladorPacotes = TextEditingController();
  final TextEditingController _controladorUnidades = TextEditingController();
  int _totalUnidades = 0;

  void _calcularTotal() {
    final paletes = int.tryParse(_controladorPaletes.text) ?? 0;
    final pacotes = int.tryParse(_controladorPacotes.text) ?? 0;
    final unidades = int.tryParse(_controladorUnidades.text) ?? 0;

    // 1 palete = 100 pacotes, 1 pacote = 6 unidades
    final total = (paletes * 100 * 6) + (pacotes * 6) + unidades;

    setState(() {
      _totalUnidades = total;
    });
  }

  @override
  void initState() {
    super.initState();
    _controladorPaletes.addListener(_calcularTotal);
    _controladorPacotes.addListener(_calcularTotal);
    _controladorUnidades.addListener(_calcularTotal);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora 2 Litros'),
        iconTheme: const IconThemeData(
          color: Colors.white, // Define a cor do botão de voltar como branco
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
              decoration: const InputDecoration(
                labelText: 'Paletes (1 palete = 100 pacotes)',
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controladorPacotes,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Pacotes (1 pacote = 6 unidades)',
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
  }
}