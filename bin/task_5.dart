class Checker {
  final String s;
  final String t;

  Checker._internal(this.s, this.t);

  factory Checker(String s, String t) {
    return Checker._internal(s, t);
  }

  bool isIsomorphic() {
    if(s.length != t.length) return false;

    Map<String, String> mapST = {};
    Map<String, String> mapTS = {};

    for(int i = 0; i < s.length; i++){
      String sChar = s[i];
      String tChar = t[i];


      if(mapST.containsKey(sChar)) {
        if (mapST[sChar] != tChar) return false;
      } else {
        mapST[sChar] = tChar;
      }

      if(mapTS.containsKey(tChar)) {
        if (mapTS[tChar] != sChar) return false;
      } else {
        mapTS[tChar] = sChar;
      }
    }

    return true;
  }


}