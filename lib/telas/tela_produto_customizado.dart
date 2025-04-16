import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:endprod/configuracao.dart';

class TelaProdutoCustomizado extends StatefulWidget {
  const TelaProdutoCustomizado({super.key});

  @override
  State<TelaProdutoCustomizado> createState() => _TelaProdutoCustomizadoState();
}

class _TelaProdutoCustomizadoState extends State<TelaProdutoCustomizado> {
  final TextEditingController _controladorPaletes = TextEditingController();
  final TextEditingController _controladorSegundoNivel = TextEditingController();
  final TextEditingController _controladorUnidades = TextEditingController();
  final TextEditingController _controladorPacotesPorPalete = TextEditingController();
  final TextEditingController _controladorNomeSegundoNivel = TextEditingController();
  final TextEditingController _controladorUnidadesPorSegundoNivel = TextEditingController();
  int _totalUnidades = 0;

  @override
  void initState() {
    super.initState();
    final configuracao = Provider.of<Configuracao>(context, listen: false);
    _controladorPacotesPorPalete.text = configuracao.pacotesPorPaleteCustomizado.toString();
    _controladorNomeSegundoNivel.text = configuracao.nomeSegundoNivelCustomizado;
    _controladorUnidadesPorSegundoNivel.text = configuracao.unidadesPorSegundoNivelCustomizado.toString();

    _controladorPaletes.addListener(() => _calcularTotal(configuracao));
    _controladorSegundoNivel.addListener(() => _calcularTotal(configuracao));
    _controladorUnidades.addListener(() => _calcularTotal(configuracao));
  }

  @override
  void dispose() {
    _controladorPaletes.dispose();
    _controladorSegundoNivel.dispose();
    _controladorUnidades.dispose();
    _controladorPacotesPorPalete.dispose();
    _controladorNomeSegundoNivel.dispose();
    _controladorUnidadesPorSegundoNivel.dispose();
    super.dispose();
  }

  void _calcularTotal(Configuracao configuracao) {
    final paletes = int.tryParse(_controladorPaletes.text) ?? 0;
    final segundoNivel = int.tryParse(_controladorSegundoNivel.text) ?? 0;
    final unidades = int.tryParse(_controladorUnidades.text) ?? 0;

    final total = (paletes * configuracao.pacotesPorPaleteCustomizado * configuracao.unidadesPorSegundoNivelCustomizado) +
        (segundoNivel * configuracao.unidadesPorSegundoNivelCustomizado) +
        unidades;

    setState(() {
      _totalUnidades = total;
    });
  }

  void _salvarConfiguracoes(BuildContext context) {
    final configuracao = Provider.of<Configuracao>(context, listen: false);
    configuracao.setPacotesPorPaleteCustomizado(int.parse(_controladorPacotesPorPalete.text));
    configuracao.setNomeSegundoNivelCustomizado(_controladorNomeSegundoNivel.text);
    configuracao.setUnidadesPorSegundoNivelCustomizado(int.parse(_controladorUnidadesPorSegundoNivel.text));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Configuracao>(
      builder: (context, configuracao, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Calculadora Personalizada'),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Configuração',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _controladorPacotesPorPalete,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Pacotes por Palete',
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _controladorNomeSegundoNivel,
                  decoration: const InputDecoration(
                    labelText: 'Nome do Segundo Nível (ex.: Pacote ou Caixa)',
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _controladorUnidadesPorSegundoNivel,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Unidades por Pacote/Caixa',
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _salvarConfiguracoes(context),
                    child: const Text('Salvar Configurações', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Calculadora',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _controladorPaletes,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Paletes (1 palete = ${configuracao.pacotesPorPaleteCustomizado} ${configuracao.nomeSegundoNivelCustomizado.toLowerCase()})',
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _controladorSegundoNivel,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '${configuracao.nomeSegundoNivelCustomizado} (1 ${configuracao.nomeSegundoNivelCustomizado.toLowerCase()} = ${configuracao.unidadesPorSegundoNivelCustomizado} unidades)',
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