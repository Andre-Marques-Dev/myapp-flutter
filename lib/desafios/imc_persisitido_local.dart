import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  runApp(MyApp());
}

class IMC {
  final double peso;
  final double altura;

  IMC(this.peso, this.altura);

  double calcular() {
    return peso / (altura * altura);
  }
}

class IMCRecord {
  final double imc;
  final DateTime data;

  IMCRecord(this.imc, this.data);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  final imcBox = Hive.box<IMCRecord>('imc_records');

  void _calcularIMC() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);
    double imc = peso / (altura * altura);

    final record = IMCRecord(imc, DateTime.now());
    imcBox.add(record);

    setState(() {
      pesoController.text = '';
      alturaController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (m)'),
            ),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular IMC'),
            ),
            Expanded(
              child: ValueListenableBuilder<Box<IMCRecord>>(
                valueListenable: imcBox.listenable(),
                builder: (context, box, _) {
                  final records = box.values.toList();
                  return ListView.builder(
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      final record = records[index];
                      return ListTile(
                        title: Text('IMC: ${record.imc.toStringAsFixed(2)}'),
                        subtitle: Text(
                            'Data: ${record.data.day}/${record.data.month}/${record.data.year}'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
