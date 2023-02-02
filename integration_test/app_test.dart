import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:login_test/login_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  group('LoginPage', () {
    testWidgets("Login UI", (tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      final username = find.byKey(const Key("usernameTextField"));
      final password = find.byKey(const Key("passwordTextField"));
      final loginButton = find.byKey(const Key("loginButton"));

      expect(username, findsOneWidget);
      expect(password, findsOneWidget);
      expect(loginButton, findsOneWidget);

      await tester.enterText(username, "username");
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(password, "password");
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(loginButton);

      await tester.pumpAndSettle(const Duration(seconds: 1));
      final successMessage = find.byKey(const Key('success'));
      expect(successMessage, findsOneWidget);
    });
  });
}
