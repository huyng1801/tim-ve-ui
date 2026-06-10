import 'package:flutter_test/flutter_test.dart';
import 'package:tim_ve_ui/app.dart';

void main() {
  testWidgets('App launches splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(EasyRoomApp());
    await tester.pump();

    expect(find.text('Easy Room'), findsOneWidget);
    expect(find.text('Tìm phòng thuê thông minh'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
  });
}
