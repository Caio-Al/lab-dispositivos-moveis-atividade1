import 'package:flutter/material.dart';

class TelaCliente extends StatelessWidget {
  const TelaCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
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
                Image.asset('assets/images/detalhe_cliente.png', width: 40),
                const SizedBox(width: 10),
                const Text(
                  'Clientes',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/cliente1.png'),
            const SizedBox(height: 10),
            const Text('Empresa de software'),
            const SizedBox(height: 20),
            Image.asset('assets/images/cliente2.png'),
            const SizedBox(height: 10),
            const Text('Empresa de auditoria'),
          ],
        ),
      ),
    );
  }
}
