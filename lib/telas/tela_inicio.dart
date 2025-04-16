import 'package:flutter/material.dart';
import 'package:endprod/telas/tela_dois_litros.dart';
import 'package:endprod/telas/tela_350_ml.dart';
import 'package:endprod/telas/tela_250_ml.dart';
import 'package:endprod/telas/tela_200_ml.dart';
import 'package:endprod/telas/tela_configuracoes.dart';
import 'package:endprod/telas/tela_produto_customizado.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém a largura da tela para tornar a imagem responsiva
    final screenWidth = MediaQuery.of(context).size.width;
    // Define o tamanho da imagem com base na largura da tela
    final imageSize = (screenWidth * 0.5).clamp(150.0, 300.0); // Entre 150 e 300 pixels

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DBG EndProd',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D1B2A),
              Color(0xFF1B263B),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/timeline-marca-dbg.jpg',
                  width: imageSize,
                  height: imageSize * 0.4, // Proporção ajustada com base na imagem
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'Erro ao carregar a imagem',
                      style: TextStyle(color: Colors.red),
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Selecione o Volume',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.cyanAccent,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                _buildFuturisticButton(
                  context,
                  '2 Litros',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaDoisLitros(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildFuturisticButton(
                  context,
                  '350 ML',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tela350ML(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildFuturisticButton(
                  context,
                  '250 ML',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tela250ML(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildFuturisticButton(
                  context,
                  '200 ML',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tela200ML(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                _buildFuturisticButton(
                  context,
                  'Produto Customizado',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaProdutoCustomizado(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildFuturisticButton(
                  context,
                  'Configurações',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaConfiguracoes(),
                      ),
                    );
                  },
                  gradientColors: const [Colors.green, Colors.teal],
                  borderColor: Colors.greenAccent,
                  shadowColor: Colors.greenAccent,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFuturisticButton(
    BuildContext context,
    String label,
    VoidCallback onPressed, {
    List<Color> gradientColors = const [Color(0xFF1B263B), Color(0xFF2A3A5A)],
    Color borderColor = Colors.cyanAccent,
    Color shadowColor = Colors.cyanAccent,
  }) {
    return GestureDetector(
      onTapDown: (_) {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 220,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor, width: 2),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: onPressed,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}