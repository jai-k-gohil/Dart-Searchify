/*
* Containing all string matching algorithms provided in package
* And also private methods acting as helper methods
* */

class MatcherImpl{

  /*    pat -> pattern
        txt -> text
        q -> A prime number
    */
  static List<int> RabinKarp(String pattern, String inputString, int q)
  {
    //note q is a prime number for strengthening hash function
    var positions = <int>[];
    Map<String, int> mappedValues = getMappedValues();
    int patternLength = pattern.length;
    int txtLength = inputString.length;
    int i, j;
    int pHash = 0; // hash value for pattern
    int tHash = 0; // hash value for txt


    // Calculate the hash value of pattern and first
    // window of text
    for (i = 0; i < patternLength; i++) {
      pHash = (pHash + mappedValues[pattern[i]]);
      tHash = (tHash + mappedValues[inputString[i]]);
    }

    // Slide the pattern over text one by one
    for (i = 0; i <= txtLength - patternLength; i++) {
      // Check the hash values of current window of text
      // and pattern. If the hash values match then only
      // check for characters on by one
      if (pHash == tHash) {
        /* Check for characters one by one */
        for (j = 0; j < patternLength; j++) {
          if (inputString[i+j] != pattern[j])
            break;
        }

        // if p == t and pat[0...patternLength-1] = txt[i, i+1, ...i+patternLength-1]
        if (j == patternLength) {
          positions.add(i);
        }
      }

      // Calculate hash value for next window of text: Remove
      // leading digit, add trailing digit
      if (i < txtLength-patternLength) {
        tHash = (tHash - mappedValues[inputString[i]]) + mappedValues[inputString[i+patternLength]];

        // We might get negative value of t, converting it
        // to positive
        if (tHash < 0)
          tHash = (tHash + q);
      }
    } //end of for
    return positions;
  }

/*
 * returns Map<characters,decimalRepresentation>
 * example {a:1,b:2}
 */
  static Map<String,int> getMappedValues() {
    List<int> a = new List<int>.generate(26, (int index) => index + 65);
    a.addAll(List.generate(26, (int index) => index + 97));
    String chars = String.fromCharCodes(a);

    Map<String, int> map  = <String, int>{};
    for(int i=0;i<a.length;i++) {
       map[chars[i]] = i;
    }
    return map;
  }
}