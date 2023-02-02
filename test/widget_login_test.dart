import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_test/login_page.dart';

void main() {
  testWidgets("Login UI", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    final username = find.byKey(const Key("usernameTextField"));
    final password = find.byKey(const Key("passwordTextField"));
    final loginButton = find.byKey(const Key("loginButton"));

    expect(username, findsOneWidget);
    expect(password, findsOneWidget);
    expect(loginButton, findsOneWidget);

    await tester.enterText(username, "username");
    await tester.enterText(password, "password");
    await tester.tap(loginButton);

    await tester.pump();
    final successMessage = find.byKey(const Key('success'));
    expect(successMessage, findsOneWidget);
  });
}
