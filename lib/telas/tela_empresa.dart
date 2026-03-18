import 'package:flutter/material.dart';

class TelaEmpresa extends StatelessWidget {
  const TelaEmpresa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresa'),
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
                Image.asset('assets/images/detalhe_empresa.png', width: 40),
                const SizedBox(width: 10),
                const Text(
                  'Sobre a empresa',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Somos uma empresa especializada em consultoria e soluções tecnológicas, '
              'atuando com foco em qualidade, inovação e atendimento ao cliente.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
