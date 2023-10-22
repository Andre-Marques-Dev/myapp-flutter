import 'dart:io';

class IMC {
  final double peso;
  final double altura;

  IMC(this.peso, this.altura);

  double calcular() {
    return peso / (altura * altura);
  }
}

void main() {
  List<IMC> registros = [];

  while (true) {
    print("Digite o peso (kg) ou '0' para sair:");
    double peso = double.parse(stdin.readLineSync()!);

    if (peso == 0) {
      break;
    }

    print("Digite a altura (m):");
    double altura = double.parse(stdin.readLineSync()!);

    IMC imc = IMC(peso, altura);
    registros.add(imc);
  }

  print("\nRegistros de IMC:");

  for (var imc in registros) {
    double resultado = imc.calcular();
    print("Peso: ${imc.peso} kg | Altura: ${imc.altura} m | IMC: $resultado");
  }
}
