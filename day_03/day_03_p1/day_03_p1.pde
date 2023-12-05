void setup(){
  String[] strs = loadStrings("input.txt");
  int[][] grid = new int[strs.length][strs[0].trim().length()];
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      char c = strs[i].charAt(j);
      if(c != '.' && (c-'0'<0||c-'0'>9)){
        grid[i][j] = 1;
      }
    }
  }
  printGrid(grid);
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      char c = strs[i].charAt(j);
      if(c-'0'>=0&&c-'0'<=9){
        grid[i][j] = 2;
      }
    }
  }
  printGrid(grid);

  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      if(grid[i][j]==2 && checkGridForAdj(grid,i,j)){
        grid[i][j]=3;
      }
    }
  }
  printGrid(grid);
  
  int changed = 1;
  while(changed!=0){
    changed = 0;
    for(int i = 0; i < grid.length; i++){
      for(int j = 0; j < grid[i].length; j++){
        if(grid[i][j]==2 && ((j>0 && grid[i][j-1]==3) || (j<grid[0].length-1 && grid[i][j+1]==3))){
          grid[i][j]=3;
          changed++;
        }
      }
    }
    println("changed: "+changed);
  }
  printGrid(grid);
  int sum = 0;
  for(int i = 0; i < strs.length; i++){
    String s = strs[i];
    int num = 0;
    for(int j = 0; j < grid[0].length; j++){
      if(grid[i][j]==3){
        int n = s.charAt(j)-'0';
        num = num * 10 + n;
      }else{
        if(num!=0){
          sum+=num;
          num = 0;
        }
      }
    }
    if(num!=0){
      sum+=num;
      num = 0;
    }
  }
  println("answer: " + sum);
}

boolean checkGridForAdj(int[][] grid, int y, int x){
  int h = grid.length;
  int w = grid[0].length;
  for(int dx = -1; dx <= 1; dx++){
    for(int dy =-1; dy <= 1; dy++){
      int x2 = x + dx;
      int y2 = y + dy;
      if(x2 >= 0 && x2 < w && y2 >= 0 && y2 < h && grid[y2][x2]==1){
        return true;
      }
    }
  }
  return false;
}

void printGrid(int[][] grid){
  println();
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      print(grid[i][j]);
    }
    print("\n");
  }
}
