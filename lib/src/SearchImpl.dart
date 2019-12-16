/*
* Containing all string matching algorithms provided in package
* And also private methods acting as helper methods
* */

class MatcherImpl{

  /**
   *  Prints occurrences of txt[] in pat[] using naive searching approach
   *  -> pattern string
   *  -> input string
   */
  static List<int> naiveSearch(String pattern, String inputString)
  {
    List<int> positions = <int>[];
    int M = pattern.length;
    int N = inputString.length;

    /* A loop to slide pattern one by one */
    for (int i = 0; i <= N - M; i++) {

      int j;

      /* For current index i, check for pattern
              match */
      for (j = 0; j < M; j++) {
        if (inputString[i + j] != pattern[j])
          break;
      }

      if (j == M) // if pat[0...M-1] = txt[i, i+1, ...i+M-1]
        positions.add(i);
    }
    return positions;
  }
  /**
   *  Prints occurrences of txt[] in pat[] using RabinKarp Algorithm
   *  -> pattern string
   *  -> input string
   *  q -> A prime number
    */
  static List<int> rabinKarpSearch(String pattern, String inputString, int q)
  {
    //note q is a prime number for strengthening hash function
    List<int> positions = <int>[];
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


  /**
   *  Prints occurrences of txt[] in pat[] using Knuth Morris Prat's algorithm
   *  -> pattern string
   *  -> inputString
   */

  static List<int> kmpSearch(String pattern, String inputString)
  {
    // create lps[] that will hold the longest prefix suffix
    // values for pattern
    List<int> longestPrefixSuffix = new List<int>(pattern.length);

    //for holding all indexes of strings matched
    List<int> positions = <int>[];

    // Preprocess the pattern (calculate lps[] array)
    computeLPSArray(pattern, longestPrefixSuffix);

    int i = 0; // index for inputString[]
    int j = 0; // index for pat[]
    while (i < inputString.length) {
      if (pattern[j] == inputString[i]) {
        j++;
        i++;
      }

      if (j == pattern.length) {
        positions.add(i-j);
        j = longestPrefixSuffix[j - 1];
      }

      // mismatch after j matches
      else if (i < inputString.length && pattern[j] != inputString[i]) {
        // Do not match lps[0..lps[j-1]] characters,
        // they will match anyway
        if (j != 0)
          j = longestPrefixSuffix[j - 1];
        else
          i = i + 1;
      }
    }
    return positions;
  }

  /**
   *  Fills longest prefix suffix[] for given patttern pat[0..M-1] in Knuth Morris Prat's algorithm
   *  -> pattern String
   *  -> longestPrefixSuffix[]
   */
  static void computeLPSArray(String pattern, List<int> longestPrefixSuffix)
  {
    // length of the previous longest prefix suffix
    int len = 0;

    longestPrefixSuffix[0] = 0; // longestPrefixSuffix[0] is always 0

    // the loop calculates longestPrefixSuffix[i] for i = 1 to patternLength-1
    int i = 1;
    while (i < pattern.length) {
      if (pattern[i] == pattern[len]) {
        len++;
        longestPrefixSuffix[i] = len;
        i++;
      }
      else // (pat[i] != pat[len])
          {
        // This is tricky. Consider the example.
        // AAACAAAA and i = 7. The idea is similar
        // to search step.
        if (len != 0) {
          len = longestPrefixSuffix[len - 1];

          // Also, note that we do not increment
          // i here
        }
        else // if (len == 0)
            {
          longestPrefixSuffix[i] = 0;
          i++;
        }
      }
    }
  }

  /**
   *  Gets all the predetermined of mapped values for characters for Rabin Karp algorithm
   *  returns Map<characters,decimalRepresentation>
   *  -> example {a:1,b:2}
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