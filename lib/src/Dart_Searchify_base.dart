import 'package:dart_searchify/src/Search.dart';
import 'package:dart_searchify/src/SearchImpl.dart';
import 'package:dart_searchify/src/LongestCommonSubsequence.dart';

class Pattern {
  String pattern = "";
  Pattern(this.pattern);

  bool matches(String inputString, int matcher) {
    switch (matcher) {
      case Search.NAIVE_SEARCH:
        List<int> positions = MatcherImpl.naiveSearch(
            this.pattern, inputString);
        if (positions.isEmpty) { return false; }
        else { return true; }
        break;

      case Search.RABIN_KARP:
        List<int> positions = MatcherImpl.rabinKarpSearch(
            this.pattern, inputString, 101);
        if (positions.isEmpty) { return false; }
        else { return true; }
        break;

      case Search.KNUTH_MORRIS:
        List<int> positions = MatcherImpl.kmpSearch(
            this.pattern, inputString);
        if (positions.isEmpty) { return false; }
        else { return true; }
        break;

      default:
        List<int> positions = MatcherImpl.kmpSearch(
            this.pattern, inputString);
        if (positions.isEmpty) { return false; }
        else { return true; }
        break;
    }
  }

  int longestCommonSubsequence(String inputString) {
    LongestCommonSubsequence lcs = LongestCommonSubsequence();
    return lcs.lcs( this.pattern, inputString, pattern.length, inputString.length);
  }

}

