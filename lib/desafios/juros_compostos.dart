import 'dart:io';
import 'dart:math';

void main() {
  var valorInicial = double.parse(stdin.readLineSync()!);
  var taxaJuros = double.parse(stdin.readLineSync()!);
  var periodo = int.parse(stdin.readLineSync()!);

  var valorFinal = calcularJurosCompostos(valorInicial, taxaJuros, periodo);

  print("Valor final do investimento: R\$ ${valorFinal.toStringAsFixed(2)}");
}

double calcularJurosCompostos(
    double valorInicial, double taxaJuros, int periodo) {
  // Converte a taxa de juros anual em uma taxa periódica
  var taxaPeriodica = 1 + taxaJuros;

  // Calcula o valor final usando a fórmula de juros compostos
  var valorFinal = valorInicial * pow(taxaPeriodica, periodo);

  return valorFinal;
}
