import 'package:flutter_test/flutter_test.dart';
import 'package:crm/app/app.dart';

void main() {
  testWidgets('App load test', (WidgetTester tester) async {
    await tester.pumpWidget(const FacilityProApp());
    expect(find.byType(FacilityProApp), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}
