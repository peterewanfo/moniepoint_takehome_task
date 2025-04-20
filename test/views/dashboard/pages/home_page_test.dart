import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint_takehome_task/data/local_data.dart';
import 'package:moniepoint_takehome_task/presentation/views/dashboard/pages/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  testWidgets('Test that Homepage renders correct fields',
      (WidgetTester tester) async {
    
    // USING IPHONE 11 SCREEN DIMENSIONS
    Size resolution = const Size(828, 1792);
    await tester.binding.setSurfaceSize(resolution);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: resolution, 
        builder: (context, child) {
          return const MediaQuery(
            data: MediaQueryData(size: Size(375, 812)),
            child: MaterialApp(
              home: HomePage(),
            ),
          );
        },
      ),
    );

    // Wait for animations to complete
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    // Check for greeting introduction
    expect(find.text("Hi, Marina"), findsOneWidget);

    // Check
    expect(find.text("let's select your\nperfect place"), findsOneWidget);
  });
}
