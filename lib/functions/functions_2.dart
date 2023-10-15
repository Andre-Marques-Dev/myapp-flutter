import 'package:myapp/functions/utils.dart' as utils;

Future<void> main(List<String> arguments) async {
  print("Bem-vindos à nossa calculadora!");

  var numero1 = lerConsoleDouble("Informe o primeiro número:");

  var numero2 = lerConsoleDouble("Informe o segundo número:");

  var operacao = lerConsole("Informe a operação matemática (+, -, *, /):");

  calcular(operacao, numero1, numero2);
}

double lerConsoleDouble(String prompt) {
  stdout.write(prompt);
  return double.parse(stdin.readLineSync()!);
}

String lerConsole(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync()!;
}

void calcular(String operacao, double numero1, double numero2) {
  double resultado = 0;
  switch (operacao) {
    case "+":
      resultado = soma(numero1, numero2);
      break;
    case "-":
      resultado = subtracao(numero1, numero2);
      break;
    case "*":
      resultado = multiplicacao(numero1, numero2);
      break;
    case "/":
      resultado = divisao(numero1, numero2);
      break;
    default:
      print("Operação inválida!");
      exit(0);
  }
  print("Operação solicitada: $operacao");
  print("O resultado da operação é: $resultado");
}

double soma(double numero1, double numero2) {
  return numero1 + numero2;
}

double subtracao(double numero1, double numero2) {
  return numero1 - numero2;
}

double multiplicacao(double numero1, double numero2) {
  return numero1 * numero2;
}

double divisao(double numero1, double numero2) {
  if (numero2 == 0) {
    print("Erro: divisão por zero não é permitida.");
    exit(0);
  }
  return numero1 / numero2;
}
