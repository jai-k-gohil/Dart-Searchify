import 'package:dart_searchify/src/Matcher.dart';
import 'package:dart_searchify/src/MatcherImpl.dart';
import 'package:dart_searchify/src/LongestCommonSubsequence.dart';

class Pattern {
  String pattern = "";
  Pattern(this.pattern);

  bool matches(String inputString, int matcher) {
    switch (matcher) {
      case Matcher.RABIN_KARP:
        List<int> positions = MatcherImpl.RabinKarpSearch(
            this.pattern, inputString, 101);
        if (positions.isEmpty) { return false; }
        else { return true; }
        break;

      case Matcher.KNUTH_MORRIS:
        List<int> positions = MatcherImpl.KMPSearch(
            this.pattern, inputString);
        if (positions.isEmpty) { return false; }
        else { return true; }
        break;

      default:
        List<int> positions = MatcherImpl.KMPSearch(
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

