import 'package:flutter/material.dart';
import 'package:endprod/telas/tela_dois_litros.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Em desenvolvimento')),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildFuturisticButton(
                context,
                '250 ML',
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Em desenvolvimento')),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildFuturisticButton(
                context,
                '200 ML',
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Em desenvolvimento')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFuturisticButton(
      BuildContext context, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTapDown: (_) {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 220,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.cyanAccent, width: 2),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF1B263B),
              Color(0xFF2A3A5A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.cyanAccent,
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 0),
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