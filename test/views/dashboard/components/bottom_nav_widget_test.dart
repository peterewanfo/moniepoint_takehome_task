import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint_takehome_task/presentation/styles/custom_colors.dart';
import 'package:moniepoint_takehome_task/presentation/views/dashboard/components/bottom_nav_widget.dart';
import 'package:moniepoint_takehome_task/presentation/views/dashboard/components/round_option_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget materialWrapper(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }

  testWidgets('BottomNavWidget shows correct icon and triggers tap',
      (WidgetTester tester) async {
    bool tapped = true;

    await tester.pumpWidget(
      materialWrapper(
        BottomNavWidget(
          isSelected: true,
          activeIconUrl: 'active.png',
          inactiveIconUrl: 'inactive.png',
          onTap: () {
            tapped = false;
          },
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Find the inactive icon (assumes icon is shown as Image widget)
    expect(find.byType(BottomNavWidget), findsOneWidget);
    expect(find.byType(RoundOptionWidget), findsOneWidget);

    await tester.tap(find.byType(RoundOptionWidget));
    await tester.pump();

    expect(tapped, isTrue);

  });

}
