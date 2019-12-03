import 'package:dart_matchify/src/Dart_Matchify_base.dart';
import 'package:dart_matchify/src/Matcher.dart';
import 'package:dart_matchify/src/MatcherImpl.dart';
import 'package:dart_matchify/src/LongestCommonSubsequence.dart';
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
