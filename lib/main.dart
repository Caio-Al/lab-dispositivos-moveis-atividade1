import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frase do Dia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FraseDoDiaPage(),
    );
  }
}

class FraseDoDiaPage extends StatefulWidget {
  const FraseDoDiaPage({super.key});

  @override
  State<FraseDoDiaPage> createState() => _FraseDoDiaPageState();
}

class _FraseDoDiaPageState extends State<FraseDoDiaPage> {
  final List<Map<String, String>> _conteudos = [
    {
      'frase':
          'O sucesso é a soma de pequenos esforços repetidos todos os dias.',
      'imagem': 'assets/images/frase1.jpg',
    },
    {
      'frase':
          'Acredite no processo, mesmo quando o resultado ainda não apareceu.',
      'imagem': 'assets/images/frase2.jpg',
    },
    {
      'frase': 'Grandes conquistas começam com a decisão de tentar.',
      'imagem': 'assets/images/frase3.jpg',
    },
    {
      'frase': 'Cada novo dia é uma nova chance para mudar sua história.',
      'imagem': 'assets/images/frase4.jpg',
    },
  ];

  int _indiceAtual = 0;

  void _sortearFrase() {
    final random = Random();
    int novoIndice = _indiceAtual;

    while (novoIndice == _indiceAtual && _conteudos.length > 1) {
      novoIndice = random.nextInt(_conteudos.length);
    }

    setState(() {
      _indiceAtual = novoIndice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemAtual = _conteudos[_indiceAtual];

    return Scaffold(
      appBar: AppBar(title: const Text('Frase do Dia'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  itemAtual['imagem']!,
                  height: 260,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 24),
                Text(
                  itemAtual['frase']!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: 220,
                  child: ElevatedButton(
                    onPressed: _sortearFrase,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Nova frase',
                      style: TextStyle(fontSize: 18),
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
