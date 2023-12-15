void setup(){
  String[] strs = loadStrings("input.txt");
  int result = 0;
  for(int i = 0; i < strs.length; i++){
    for(String s : strs[i].split(",")){
      result += hash(s);
    }
  }
  println("Answer: "+result);
}

int hash(String s){
  int result = 0;
  for(int i = 0; i < s.length(); i++){
    int n = int(s.charAt(i));
    result+=n;
    result*=17;
    result = result%256;
  }
  return result;
}
