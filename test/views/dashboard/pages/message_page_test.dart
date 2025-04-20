import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint_takehome_task/presentation/views/dashboard/pages/message_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  testWidgets('Test that MessagePage renders with correct text and layout', (WidgetTester tester) async {

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 720),
        builder: (context, child) {
          return const MaterialApp(
            home: MessagePage(),
          );
        },
      ),
    );

    // Wait for animations to complete
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    // Check for the text widget
    expect(find.text("Empty Inbox :)"), findsOneWidget);

    // You could also check for column structure or decorations if needed
    final container = tester.widget<Container>(find.byType(Container).first);
    expect(container.decoration, isA<BoxDecoration>());
  });
}