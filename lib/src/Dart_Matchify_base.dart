import 'package:dart_matchify/src/Matcher.dart';
import 'package:dart_matchify/src/MatcherImpl.dart';

class Pattern {
  String pattern = "";
  Pattern(this.pattern);

  bool matches(String inputString, int matcher) {
    switch (matcher) {
      case Matcher.RABIN_KARP:
        List<int> positions = MatcherImpl.RabinKarp(this.pattern, inputString, 101);
        if(positions.isEmpty) { return false; }
        else { return true; }
        break;
       default:
        print("Default uses Rabin karp");
        List<int> positions = MatcherImpl.RabinKarp(this.pattern, inputString, 101);
        if(positions.isEmpty) { return false; }
        else { return true; }
        break;
    }
  }

}

