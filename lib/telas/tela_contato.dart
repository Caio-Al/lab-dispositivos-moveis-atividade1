import 'package:flutter/material.dart';

class TelaContato extends StatelessWidget {
  const TelaContato({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/images/detalhe_contato.png', width: 40),
                const SizedBox(width: 10),
                const Text(
                  'Contato',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Email: contato@atmconsultoria.com.br'),
            const SizedBox(height: 10),
            const Text('Telefone: (75) 99999-9999'),
            const SizedBox(height: 10),
            const Text('Cidade: Salvador - BA'),
          ],
        ),
      ),
    );
  }
}
