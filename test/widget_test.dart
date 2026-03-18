import 'package:flutter_test/flutter_test.dart';
import 'package:frase_do_dia/main.dart';

void main() {
  testWidgets('App da calculadora flex carrega corretamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Calculadora Flex'), findsOneWidget);
    expect(find.text('Calcular'), findsOneWidget);
    expect(find.text('Preço do etanol'), findsOneWidget);
    expect(find.text('Preço da gasolina'), findsOneWidget);
  });
}
