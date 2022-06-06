import 'package:test/test.dart';
import 'package:flutter_tdd_clean/main/factories/factories.dart';
import 'package:flutter_tdd_clean/validation/validators/validators.dart';

void main() {
  test("Should return the correct validations", () {
    final validations = makeLoginValidations();
    expect(validations, [
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password')
    ]);
  });
}
