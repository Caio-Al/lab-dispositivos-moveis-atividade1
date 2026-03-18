import 'package:flutter/material.dart';
import 'telas/tela_cliente.dart';
import 'telas/tela_contato.dart';
import 'telas/tela_empresa.dart';
import 'telas/tela_inicial.dart';
import 'telas/tela_servico.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade 06',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaInicial(),
        '/empresa': (context) => const TelaEmpresa(),
        '/servico': (context) => const TelaServico(),
        '/cliente': (context) => const TelaCliente(),
        '/contato': (context) => const TelaContato(),
      },
    );
  }
}
