A library for Dart developers.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
import 'package:Dart_Matchify/Dart_Matchify.dart';

main() {
    String patternString = "abcdef";
    String testString = "abcdefghijabcdef";
    
    //setting first pattern string
    Pattern pattern = Pattern(patternString);
  
    //now compare testString with pattern
    if(pattern.matches(testString, Matcher.RabinKarp)) {
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

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
