void setup(){
  String[] strs = loadStrings("input.txt");
  String content = "";
  for(int i = 0; i < strs.length; i++){
    content += strs[i]+"\n";
  }
    
  String[] GS = content.split("\n\n");
  int sum = 0;
  for(int i = 0; i < GS.length; i++){
    sum += getValue(GS[i]);
  }
  println(sum);
}

int getValue(String grid){
  int vert = getVertSym(grid);
  int horz = getHorzSym(grid);
  if(vert == -1){
    return horz*100;
  }else if(horz == -1){
    return vert;
  }else{
    return -1;
  }
}

int getVertSym(String grid){
  String[] arr = grid.split("\n");
  for(int i = 0; i < arr[0].length() - 1; i++){
    int left = i;
    int right = i+1;
    int diff = 0;
    while(left >= 0 && right < arr[0].length()){
      for(int j = 0; j < arr.length; j++){
        if(arr[j].charAt(right)!=arr[j].charAt(left)){
          diff+=1;
        }
      }
      left--;
      right++;
    }
    if(diff == 1){
      return i+1;
    }
  }
  return -1;
}

int getHorzSym(String grid){
  String[] arr = grid.split("\n");
  for(int i = 0; i < arr.length - 1; i++){
    int up = i;
    int down = i+1;
    int diff = 0;
    while(up >= 0 && down < arr.length){
      for(int j = 0; j < arr[0].length(); j++){
        if(arr[up].charAt(j)!=arr[down].charAt(j)){
          diff+=1;
        }
      }
      up--;
      down++;
    }
    if(diff == 1){
      return i+1;
    }
  }
  return -1;
}
