
import 'package:flutter_test/flutter_test.dart';
import 'package:territory_predictive_insights/main.dart';

void main() {
  testWidgets('Aplicativo inicia corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const TerritoryApp());

    expect(find.text('Predictive Insights'), findsOneWidget);
    expect(find.text('Visão geral do território'), findsOneWidget);
  });
}
