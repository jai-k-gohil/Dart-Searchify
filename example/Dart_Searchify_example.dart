import 'package:dart_searchify/src/Dart_Searchify_base.dart';
import 'package:dart_searchify/src/Search.dart';

main() {
  String patternString = "abcdef";
  String testString = "abcdefghijabcdef";

  //setting first pattern string
  Pattern pattern = Pattern(patternString);

  //now compare string with testString
  print("Comparing strings using rabin karp algorithm!");
  if(pattern.matches(testString, Search.RABIN_KARP)) {
    print("Pattern match found!");
  } else {
    print("Pattern match not found.");
  }

  //now compare string with testString
  print("Comparing strings using knuth morris algorithm!");
  if(pattern.matches(testString, Search.KNUTH_MORRIS)) {
    print("Pattern match found.");
  } else {
    print("Pattern match not found.");
  }

  /*Note Matcher is an interface having to choose algorithm used for string matching
  in this case it defaults to Knuth Morris algorithm for pattern matching */

  //Additionally you can also view longest common sequence using LCS algorithm.
  print("Longest Common subsequence between pattern and inputString using LCS is ${ pattern.longestCommonSubsequence(testString)}");
}
