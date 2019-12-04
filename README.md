A library for Dart developers.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
import 'package:Dart_Searchify/Dart_Searchify.dart';

main() {
    String patternString = "abcdef";
    String testString = "abcdefghijabcdef";
    
    //setting first pattern string
    Pattern pattern = Pattern(patternString);
  
    //now compare testString with pattern
    if(pattern.matches(testString, Search.RABIN_KARP)) {
      print("Pattern match found!");
    } else {
      print("Pattern match not found.");
    }
    
    /*
    * Note Matcher is an interface having to choose algorithm used for string matching
    *  In this case it uses Rabin Karp Algorithm for pattern matching 
    */
}
```
## About Package
As the package provides a couple of string search algorithms some of them are listed below.

| Algorithm | Processing Time | Matching time | Space |
| :-------- | :-------------- | :------------ | :---- |
| Naive string-search algorithm	 | none | Θ(nm)	| none|
| Rabin–Karp algorithm | Θ(m) | average Θ(n + m),worst Θ((n−m)m)		| O(1) |
| Knuth–Morris–Pratt algorithm	 | Θ(m) | Θ(n)	| Θ(m) |
| Boyer–Moore string-search algorithm	 | Θ(m+k) | best Ω(n/m), worst O(mn)	| Θ(k) |
| Two-way string-matching algorithm	 | Θ(m) | O(m+n) | O(1) |

More coming soon..

Intrigued and want to know more about string search click [here](https://en.wikipedia.org/wiki/String-searching_algorithm).

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
