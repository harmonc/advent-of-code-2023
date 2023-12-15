void setup() {
  int result = 0;
  String[] strs = loadStrings("input.txt");
  for (int i = 0; i < strs.length; i++) {
    result += myFunc(strs[i]);
  }
  println("Answer: " + result);
  exit();
}

int myFunc(String str) {
  String[] parts = str.split(" ");
  String[] numStrs = parts[1].split(",");
  int[] nums = new int[numStrs.length];
  for(int i = 0; i < numStrs.length; i++){
    nums[i] = int(numStrs[i]);
  }
  int test = getPossibilites(parts[0], nums, 0);
  println(str + " : " + test);
  return test;
}

int getPossibilites(String row, int[] nums, int i) {
  if (i == row.length()) {
    return isValid(row, nums)?1:0;
  }else{
    if(row.charAt(i)=='?'){
      return getPossibilites(row.substring(0,i)+"."+row.substring(i+1),nums,i+1)
      +getPossibilites(row.substring(0,i)+"#"+row.substring(i+1),nums,i+1);
    }else{
      return getPossibilites(row,nums,i+1);
    }
  }
}

boolean isValid(String row, int[] nums) {
  int count = 0;
  int matchI = 0;
  for (int i = 0; i < row.length(); i++) {
    if (row.charAt(i)=='#') {
      count++;
    } else if (count>0) {
      if (nums.length==matchI || nums[matchI]!=count) {
        return false;
      }
      count = 0;
      matchI++;
    }
  }
  if (count>0) {
    if (nums.length==matchI || nums[matchI]!=count) {
      return false;
    }
    count = 0;
    matchI++;
  }
  
  return matchI==nums.length;
}
