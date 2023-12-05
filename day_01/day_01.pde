String[] digits = {"one","two","three","four","five","six","seven","eight","nine"};

void setup(){
  String[] strs = loadStrings("input.txt");
  int sum = 0;
  for(int i = 0; i < strs.length; i++){
    println(getCalibrationValue(strs[i]));
    sum += getCalibrationValue(strs[i]);
  }
  println(sum);
}

int getCalibrationValue(String s){
  int first = 0;
  int last = 0;
  for(int i = 0; i < s.length(); i++){
    int v = s.charAt(i)-'0';
    if(v >= 0 && v <= 9){
      first = v;
      break;
    }
    boolean found = false;
    for(int j = 0; j < digits.length; j++){
      if(s.indexOf(digits[j], i)==i){
        first = j+1;
        found = true;
        break;
      }
    }
    if(found){
      break;
    }
  }
  for(int i = s.length()-1; i >= 0; i--){
    int v = s.charAt(i)-'0';
    if(v >= 0 && v <= 9){
      last = v;
      break;
    }
    boolean found = false;
    for(int j = 0; j < digits.length; j++){
      if(s.indexOf(digits[j], i)==i){
        last = j+1;
        found = true;
        break;
      }
    }
    if(found){
      break;
    }
  }
  return first*10+last;
}  
