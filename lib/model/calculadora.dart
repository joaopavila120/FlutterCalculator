import 'package:app_calculadora/model/enum/type_operator_enum.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculadora {
  double? valor1;
  double? valor2;
  TypeOperator? typeOperator;
  double? resultado;

  void calcula() {
    switch (typeOperator) {
      case TypeOperator.somar:
        resultado = valor1! + valor2!;
        break;
      case TypeOperator.subtrair:
        resultado = valor1! - valor2!;
        break;
      case TypeOperator.multiplicar:
        resultado = valor1! * valor2!;
        break;
      case TypeOperator.dividir:
        resultado = valor1! / valor2!;
        break;
    }
  }

  String get calculoRealizado {
    String temp = '';
    switch (typeOperator) {
      case TypeOperator.somar:
        temp = '$valor1 + $valor2';
        break;
      case TypeOperator.subtrair:
        temp = '$valor1 - $valor2';
        break;
      case TypeOperator.multiplicar:
        temp = '$valor1 x $valor2';
        break;
      case TypeOperator.dividir:
        temp = '$valor1 / $valor2';
        break;
    }
    return temp;
  }

  void set type(value) {
    switch (value) {
      case 'somar':
        typeOperator = TypeOperator.somar;
        break;
      case 'subtrair':
        typeOperator = TypeOperator.subtrair;
        break;
      case 'multiplicar':
        typeOperator = TypeOperator.multiplicar;
        break;
      case 'dividir':
        typeOperator = TypeOperator.dividir;
        break;
    }
  }
}
