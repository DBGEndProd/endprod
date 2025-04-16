import 'package:flutter/material.dart';

class Configuracao with ChangeNotifier {
  // Valores padrão de pacotes por palete
  int _pacotesPorPalete2Litros = 100;
  int _pacotesPorPalete350ML = 261;
  int _pacotesPorPalete250ML = 304;
  int _pacotesPorPalete200ML = 380;

  // Configurações do Produto Customizado
  int _pacotesPorPaleteCustomizado = 100; // Valor padrão
  String _nomeSegundoNivelCustomizado = "Pacote/Caixa"; // Nome padrão
  int _unidadesPorSegundoNivelCustomizado = 6; // Valor padrão

  // Getters para volumes fixos
  int get pacotesPorPalete2Litros => _pacotesPorPalete2Litros;
  int get pacotesPorPalete350ML => _pacotesPorPalete350ML;
  int get pacotesPorPalete250ML => _pacotesPorPalete250ML;
  int get pacotesPorPalete200ML => _pacotesPorPalete200ML;

  // Getters para produto customizado
  int get pacotesPorPaleteCustomizado => _pacotesPorPaleteCustomizado;
  String get nomeSegundoNivelCustomizado => _nomeSegundoNivelCustomizado;
  int get unidadesPorSegundoNivelCustomizado => _unidadesPorSegundoNivelCustomizado;

  // Setters para volumes fixos
  void setPacotesPorPalete2Litros(int value) {
    _pacotesPorPalete2Litros = value;
    notifyListeners();
  }

  void setPacotesPorPalete350ML(int value) {
    _pacotesPorPalete350ML = value;
    notifyListeners();
  }

  void setPacotesPorPalete250ML(int value) {
    _pacotesPorPalete250ML = value;
    notifyListeners();
  }

  void setPacotesPorPalete200ML(int value) {
    _pacotesPorPalete200ML = value;
    notifyListeners();
  }

  // Setters para produto customizado
  void setPacotesPorPaleteCustomizado(int value) {
    _pacotesPorPaleteCustomizado = value;
    notifyListeners();
  }

  void setNomeSegundoNivelCustomizado(String value) {
    _nomeSegundoNivelCustomizado = value;
    notifyListeners();
  }

  void setUnidadesPorSegundoNivelCustomizado(int value) {
    _unidadesPorSegundoNivelCustomizado = value;
    notifyListeners();
  }
}