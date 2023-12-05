void setup(){
  String[] strs = loadStrings("input.txt");
  int[][] grid = new int[strs.length][strs[0].trim().length()];
  int gearNum = 1;
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      char c = strs[i].charAt(j);
      if(c == '*'){
        grid[i][j] = gearNum;
        gearNum++;
      }
    }
  }
  printGrid(grid);
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      char c = strs[i].charAt(j);
      if(c-'0'>=0&&c-'0'<=9){
        grid[i][j] = -1;
      }
    }
  }
  printGrid(grid);

  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      int gearN = checkGridForAdj(grid,i,j);
      if(grid[i][j]==-1 && gearN>0){
        grid[i][j]=gearN;
      }
    }
  }
  printGrid(grid);
  
  int changed = 1;
  while(changed!=0){
    changed = 0;
    for(int i = 0; i < grid.length; i++){
      for(int j = 0; j < grid[i].length; j++){
        if(grid[i][j]==-1 && (j>0 && grid[i][j-1]>0)){
          grid[i][j]=grid[i][j-1];
          changed++;
        }else if(grid[i][j]==-1 && (j<grid[0].length-1 && grid[i][j+1]>0)){
          grid[i][j]=grid[i][j+1];
          changed++;
        }
      }
    }
    println("changed: "+changed);
  }
  printGrid(grid);

  int[][] arr = new int[gearNum][3];
  printArr(arr);

  for(int i = 0; i < strs.length; i++){
    String s = strs[i];
    int num = 0;
    int gear = 0;
    for(int j = 0; j < grid[0].length; j++){
      if(grid[i][j]>0 && s.charAt(j)!='*'){
        gear = grid[i][j];
        int n = s.charAt(j)-'0';
        num = num * 10 + n;
      }else{
        if(num!=0){
          if(arr[gear-1][0]==0){
            arr[gear-1][0] = num;
          }else if(arr[gear-1][1]==0){
            arr[gear-1][1] = num;
          }else if(arr[gear-1][2]==0){
            arr[gear-1][2] = num;
          }
          println(num + "," + gear);
          num = 0;
        }
      }
    }
    if(num!=0){
      println(num);
      num = 0;
    }
  }
  long sum = 0;
  for(int i = 0; i < arr.length; i++){
    if(arr[i][2]==0 && arr[i][1]!=0){
      sum += arr[i][0]*arr[i][1];      
    }
  }
  println(sum);
}

int checkGridForAdj(int[][] grid, int y, int x){
  int h = grid.length;
  int w = grid[0].length;
  for(int dx = -1; dx <= 1; dx++){
    for(int dy =-1; dy <= 1; dy++){
      int x2 = x + dx;
      int y2 = y + dy;
      if(x2 >= 0 && x2 < w && y2 >= 0 && y2 < h && grid[y2][x2]>0){
        return grid[y2][x2];
      }
    }
  }
  return 0;
}

void printArr(int[][] arr){
  for(int i = 0; i < arr.length; i++){
    for(int j = 0; j < arr[i].length; j++){
      print(arr[i][j]+",");
    }
    println();
  }
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
