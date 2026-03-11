import 'package:flutter_test/flutter_test.dart';
import 'package:frase_do_dia/main.dart';

void main() {
  testWidgets('App Frase do Dia carrega corretamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Frase do Dia'), findsOneWidget);
    expect(find.text('Nova frase'), findsOneWidget);
  });
}
