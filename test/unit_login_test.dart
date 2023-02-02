import 'package:flutter_test/flutter_test.dart';
import 'package:login_test/login_controller.dart';

void main() {
  group('Login controller', () {
    test("success login", () {
      LoginController controller = LoginController();
      expect(controller.login("username", "password"), true);
    });

    test("failed login", () {
      LoginController controller = LoginController();
      expect(controller.login("invalidUsername", "invalidPassword"), false);
    });
  });
}
