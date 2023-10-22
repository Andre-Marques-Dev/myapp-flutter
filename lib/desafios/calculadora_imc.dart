import 'dart:io';

void main() {
  print("Calculadora de IMC");

  stdout.write("Digite seu peso em kg: ");
  var peso = double.parse(stdin.readLineSync()!);

  stdout.write("Digite sua altura em metros: ");
  var altura = double.parse(stdin.readLineSync()!);

  var imc = calcularIMC(peso, altura);

  print("Seu IMC é: $imc");
  interpretarIMC(imc);
}

double calcularIMC(double peso, double altura) {
  return peso / (altura * altura);
}

void interpretarIMC(double imc) {
  if (imc < 18.5) {
    print("Abaixo do peso");
  } else if (imc >= 18.5 && imc < 24.9) {
    print("Peso normal");
  } else if (imc >= 25 && imc < 29.9) {
    print("Sobrepeso");
  } else if (imc >= 30 && imc < 34.9) {
    print("Obesidade Grau I");
  } else if (imc >= 35 && imc < 39.9) {
    print("Obesidade Grau II");
  } else {
    print("Obesidade Grau III");
  }
}
