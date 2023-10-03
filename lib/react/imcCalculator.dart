import 'package:flutter/material.dart';

class ImcCalculator extends ChangeNotifier {
  double imc = 0;

  void calculo(double altura, double peso) {
    double alturaImc = ((altura / 100) * (altura / 100));
    imc = peso / alturaImc;
    notifyListeners();
  }
}

class ProviderImcCalculator{
  static ImcCalculator imcCalculator = ImcCalculator();
}