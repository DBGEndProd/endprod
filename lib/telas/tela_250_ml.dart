import 'package:flutter/material.dart';

class Tela250ML extends StatefulWidget {
  const Tela250ML({super.key});

  @override
  State<Tela250ML> createState() => _Tela250MLState();
}

class _Tela250MLState extends State<Tela250ML> {
  final TextEditingController _controladorPaletes = TextEditingController();
  final TextEditingController _controladorPacotes = TextEditingController();
  final TextEditingController _controladorUnidades = TextEditingController();
  int _totalUnidades = 0;

  void _calcularTotal() {
    final paletes = int.tryParse(_controladorPaletes.text) ?? 0;
    final pacotes = int.tryParse(_controladorPacotes.text) ?? 0;
    final unidades = int.tryParse(_controladorUnidades.text) ?? 0;

    // 1 palete = 304 pacotes, 1 pacote = 12 unidades
    final total = (paletes * 304 * 12) + (pacotes * 12) + unidades;

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
        title: const Text('Calculadora 250 ML'),
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
              decoration: const InputDecoration(
                labelText: 'Paletes (1 palete = 304 pacotes)',
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
  }
}