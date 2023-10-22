import 'dart:convert';
import 'dart:io';

void main() {
  double saldo = 0.0;

  while (true) {
    double valorDeposito =
        double.tryParse(stdin.readLineSync(encoding: utf8)!) ?? -1;

    if (valorDeposito < 0) {
      stdout.write('Valor invalido! Digite um valor maior que zero.');
    } else if (valorDeposito > 0) {
      saldo += valorDeposito;
      print("Deposito realizado com sucesso.");
      print('Saldo atual: R\$ ${saldo.toStringAsFixed(2)}');
      break;
    } else {
      print("Encerrando o programa...");
      break;
    }
  }
}
