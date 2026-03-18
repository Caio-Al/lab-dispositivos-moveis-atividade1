import 'package:flutter_test/flutter_test.dart';
import 'package:frase_do_dia/main.dart';

void main() {
  testWidgets('App da atividade 05 carrega corretamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Atividade 05'), findsOneWidget);
    expect(find.text('Calculadora Flex'), findsOneWidget);
    expect(find.text('Calcular'), findsOneWidget);
    expect(find.text('Checkbox'), findsOneWidget);
    expect(find.text('Switch'), findsOneWidget);
    expect(find.text('Radio'), findsNWidgets(1));
    expect(find.text('Slider'), findsOneWidget);
  });
}
