import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM Consultoria'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset('assets/images/logo.png', width: 220),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/empresa'),
                  child: Image.asset(
                    'assets/images/menu_empresa.png',
                    width: 120,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/servico'),
                  child: Image.asset(
                    'assets/images/menu_servico.png',
                    width: 120,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/cliente'),
                  child: Image.asset(
                    'assets/images/menu_cliente.png',
                    width: 120,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/contato'),
                  child: Image.asset(
                    'assets/images/menu_contato.png',
                    width: 120,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
