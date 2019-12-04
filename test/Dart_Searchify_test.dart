import 'package:dart_searchify/src/Dart_Searchify_base.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Pattern pattern;
    String inputString;
    setUp(() {
      pattern = Pattern("abcde");
      inputString = "abcdebbnffnabcde";

    });

    test('First Test', () {
      expect(pattern.matches(inputString,2), isTrue);
    });
  });
}
