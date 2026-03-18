import 'package:flutter/material.dart';

class TelaServico extends StatelessWidget {
  const TelaServico({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços'),
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
                Image.asset('assets/images/detalhe_servico.png', width: 40),
                const SizedBox(width: 10),
                const Text(
                  'Nossos serviços',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('• Consultoria'),
            const Text('• Cálculo de preços'),
            const Text('• Acompanhamento de projetos'),
            const Text('• Desenvolvimento de sistemas'),
          ],
        ),
      ),
    );
  }
}
