import 'package:flutter_test/flutter_test.dart';
import 'package:curso_arquitetura_software/utils/result.dart';

void main() {
  group('Result tests', () {
    test("Result Ok", () {
      final result = getResultOk();
      expect(result, isA<Ok<String>>());

      expect(result.asValue.value, "String retornada");
    });

    test("Result Error", () {
      final result = getResultError();

      expect(result, isA<Error>());

      print(result.asError.error.toString());
    });
  });
}

Result<String> getResultOk() {
  return Result.ok("String retornada");
}

Result<String> getResultError() {
  return Result.error(Exception());
}
