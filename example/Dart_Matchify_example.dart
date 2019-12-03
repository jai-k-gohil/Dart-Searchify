import 'package:dart_matchify/src/Dart_Matchify_base.dart';
import 'package:dart_matchify/src/Matcher.dart';

main() {
  String patternString = "abcdef";
  String testString = "abcdefghijabcdef";

  //setting first pattern string
  Pattern pattern = Pattern(patternString);

  //now compare string with testString
  if(pattern.matches(testString, Matcher.RABIN_KARP)) {
    print("Pattern match found!");
  } else {
    print("Pattern match not found.");
  }

  /*Note Matcher is an interface having to choose algorithm used for string matching
  in this case it uses Rabin Karp Algorithm for pattern matching */

  //Additionally you can also view longest common sequence using LCS algorithm.
  print("Longest Common subsequence between pattern and inputString using LCS is ${ pattern.longestCommonSubsequence(testString)}");
}
