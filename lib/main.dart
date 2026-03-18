import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade 05',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const Atividade05Page(),
    );
  }
}

class Atividade05Page extends StatefulWidget {
  const Atividade05Page({super.key});

  @override
  State<Atividade05Page> createState() => _Atividade05PageState();
}

class _Atividade05PageState extends State<Atividade05Page> {
  final TextEditingController _etanolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();

  String _resultado = 'Informe os preços para calcular.';
  String _detalhe = '';

  bool _checkboxMarcado = false;
  bool _switchLigado = true;
  int _radioSelecionado = 1;
  double _sliderValor = 50;

  Future<void> _abrirLink(String url) async {
    final Uri uri = Uri.parse(url);

    final bool abriu = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!abriu && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir o link.')),
      );
    }
  }

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

  Widget _tituloSecao(String texto) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _tituloClicavel(String texto, String url) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () => _abrirLink(url),
        child: Text(
          texto,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
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
      appBar: AppBar(title: const Text('Atividade 05'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _tituloSecao('Calculadora Flex'),
                    const SizedBox(height: 16),
                    const Icon(
                      Icons.local_gas_station,
                      size: 90,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _calcularMelhorCombustivel,
                        child: const Text('Calcular'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: _limparCampos,
                        child: const Text('Limpar'),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (_detalhe.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        _detalhe,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tituloSecao('Exemplos de Widgets'),
                    const SizedBox(height: 12),

                    // ALTERE AQUI os links se quiser trocar pela doc em PT/EN
                    _tituloClicavel(
                      'Checkbox',
                      'https://api.flutter.dev/flutter/material/Checkbox-class.html',
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _checkboxMarcado,
                          onChanged: (value) {
                            setState(() {
                              _checkboxMarcado = value ?? false;
                            });
                          },
                        ),
                        Text(_checkboxMarcado ? 'Marcado' : 'Desmarcado'),
                      ],
                    ),

                    const SizedBox(height: 10),

                    _tituloClicavel(
                      'Switch',
                      'https://api.flutter.dev/flutter/material/Switch-class.html',
                    ),
                    Row(
                      children: [
                        Switch(
                          value: _switchLigado,
                          onChanged: (value) {
                            setState(() {
                              _switchLigado = value;
                            });
                          },
                        ),
                        Text(_switchLigado ? 'Ligado' : 'Desligado'),
                      ],
                    ),

                    const SizedBox(height: 10),

                    _tituloClicavel(
                      'Radio',
                      'https://api.flutter.dev/flutter/material/Radio-class.html',
                    ),
                    RadioListTile<int>(
                      title: const Text('Opção 1'),
                      value: 1,
                      groupValue: _radioSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _radioSelecionado = value!;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: const Text('Opção 2'),
                      value: 2,
                      groupValue: _radioSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _radioSelecionado = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 10),

                    _tituloClicavel(
                      'Slider',
                      'https://api.flutter.dev/flutter/material/Slider-class.html',
                    ),
                    Slider(
                      value: _sliderValor,
                      min: 0,
                      max: 100,

                      // ALTERE AQUI se quiser mais ou menos divisões
                      divisions: 10,

                      label: _sliderValor.toStringAsFixed(0),
                      onChanged: (value) {
                        setState(() {
                          _sliderValor = value;
                        });
                      },
                    ),
                    Text(
                      'Valor atual do slider: ${_sliderValor.toStringAsFixed(0)}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
