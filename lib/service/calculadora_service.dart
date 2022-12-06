import 'package:app_calculadora/model/calculadora.dart';
import 'package:flutter/material.dart';

class CalculadoraService extends ChangeNotifier {

  TextEditingController controllerValor1 = TextEditingController();
  TextEditingController controllerValor2 = TextEditingController();

  List<Calculadora> _calculos = [];
  List<Calculadora> get calculos => _calculos;

  Calculadora _calculoAtual = Calculadora();
  Calculadora get calculoAtual => _calculoAtual;
  set calculoAtual(Calculadora value) {
    _calculoAtual = value;
  }

  CalculadoraService() {
    calculoAtual = Calculadora();
  }

  void calcular(){
    calculoAtual.calcular();

    calculos.add(calculoAtual);

    //zera as variaveis
    calculoAtual = Calculadora();
    controllerValor1.clear();
    controllerValor2.clear();

    notifyListeners();
  }

}