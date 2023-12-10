PrintWriter output;

void setup() {
  String[] strs = loadStrings("input.txt");
  int[][] grid = new int[strs.length][strs[0].length()];
  ArrayList<LoopRunner> runners = new ArrayList();
  for (int i = 0; i < strs.length; i++) {
    for (int j = 0; j < strs[0].length(); j++) {
      if (strs[i].charAt(j)=='S') {
        if (i > 0 && inString(strs[i-1].charAt(j), "F|7")) {
          runners.add(new LoopRunner(0, i, j));
        }
        if (i < strs.length-1 && inString(strs[i+1].charAt(j), "L|F")) {
          runners.add(new LoopRunner(2, i, j));
        }
        if (j>0 && inString(strs[i].charAt(j-1), "FL-")) {
          runners.add(new LoopRunner(3, i, j));
        }
        if (j<strs[0].length()-1 && inString(strs[i].charAt(j+1), "-J7")) {
          runners.add(new LoopRunner(1, i, j));
        }
        grid[i][j]=0;
      } else {
        grid[i][j]=-1;
      }
    }
  }
  println(runners.size());
  while (!allDone(runners)) {
    for (LoopRunner r : runners) {
      if (!r.done) {
        r.step();
        char pipe = strs[r.y].charAt(r.x);
        r.update(pipe);
        if (grid[r.y][r.x]==-1) {
          grid[r.y][r.x] = r.steps;
        } else {
          r.done = true;
        }
      }
    }
  }
  printGrid(grid);
  println();
  println("Answer: "+getMax(grid));
}

boolean allDone(ArrayList<LoopRunner> runners) {
  for (LoopRunner r : runners) {
    if (!r.done) {
      return false;
    }
  }
  return true;
}

boolean inString(char c, String s) {
  return s.indexOf(c)>=0;
}

int getMax(int[][] arr){
  int max = arr[0][0];
  for(int i = 0; i < arr.length; i++){
    for(int j = 0; j < arr[i].length;j++){
      if(arr[i][j]>max){
        max = arr[i][j];
      }
    }
  }
  return max;
}

void printGrid(int[][] grid){
  output = createWriter("grid.txt"); 
  for(int i = 0; i < grid.length; i++){
    output.println();
    for(int j = 0; j < grid[i].length; j++){
      if(grid[i][j]<0){
        output.print(".,");
      }else{
        output.print(grid[i][j]+",");
      }
    }
  }
  exit();
}
