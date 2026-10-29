import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loginregister/main.dart';

void main() {
  testWidgets('registers a user and returns to login with username', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const LoginRegisterApp());

    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'miko');
    await tester.enterText(find.byType(TextField).at(1), 'admin123');
    await tester.enterText(find.byType(TextField).at(2), 'admin123');
    await tester.tap(find.text('Create Account'));
    await tester.pumpAndSettle();

    expect(find.text('Lastname Activity 2'), findsOneWidget);
    expect(find.text('miko'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(1), 'admin123');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('user: miko'), findsOneWidget);
    expect(find.text('Password: admin123'), findsOneWidget);
    expect(find.text('Back to Login'), findsOneWidget);
  });
}
