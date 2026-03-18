import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Flex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const CalculadoraFlexPage(),
    );
  }
}

class CalculadoraFlexPage extends StatefulWidget {
  const CalculadoraFlexPage({super.key});

  @override
  State<CalculadoraFlexPage> createState() => _CalculadoraFlexPageState();
}

class _CalculadoraFlexPageState extends State<CalculadoraFlexPage> {
  final TextEditingController _etanolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();

  String _resultado = 'Informe os preços para calcular.';
  String _detalhe = '';

  void _calcularMelhorCombustivel() {
    final double? etanol = double.tryParse(
      _etanolController.text.replaceAll(',', '.').trim(),
    );

    final double? gasolina = double.tryParse(
      _gasolinaController.text.replaceAll(',', '.').trim(),
    );

    if (etanol == null || gasolina == null || etanol <= 0 || gasolina <= 0) {
      setState(() {
        _resultado = 'Digite valores válidos maiores que zero.';
        _detalhe = '';
      });
      return;
    }

    final double proporcao = etanol / gasolina;

    setState(() {
      _detalhe = 'Proporção: ${(proporcao * 100).toStringAsFixed(1)}%';

      if (proporcao <= 0.70) {
        _resultado = 'Melhor abastecer com etanol.';
      } else {
        _resultado = 'Melhor abastecer com gasolina.';
      }
    });
  }

  void _limparCampos() {
    _etanolController.clear();
    _gasolinaController.clear();

    setState(() {
      _resultado = 'Informe os preços para calcular.';
      _detalhe = '';
    });
  }

  @override
  void dispose() {
    _etanolController.dispose();
    _gasolinaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora Flex'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Icon(
                  Icons.local_gas_station,
                  size: 100,
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Descubra qual combustível compensa mais',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 28),
                TextField(
                  controller: _etanolController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Preço do etanol',
                    hintText: 'Ex: 4,29',
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _gasolinaController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Preço da gasolina',
                    hintText: 'Ex: 6,19',
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _calcularMelhorCombustivel,
                    child: const Text('Calcular'),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _limparCampos,
                    child: const Text('Limpar'),
                  ),
                ),
                const SizedBox(height: 24),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'Resultado',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _resultado,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                        ),
                        if (_detalhe.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            _detalhe,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
