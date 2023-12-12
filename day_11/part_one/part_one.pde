void setup() {
  String[] strs = loadStrings("input.txt");
  int[][] grid = new int[strs.length][strs[0].length()];
  for (int i = 0; i < strs.length; i++) {
    for (int j = 0; j < strs[i].length(); j++) {
      grid[i][j] = (strs[i].charAt(j) == '#')? 1:0;
    }
  }
  printGrid(grid);

  ArrayList<Integer> emptyRows = new ArrayList();
  ArrayList<Integer> emptyCols = new ArrayList();

  for (int i = 0; i < grid.length; i++) {
    boolean empty = true;
    for (int j = 0; j < grid[0].length; j++) {
      if (grid[i][j]==1) {
        empty = false;
      }
    }
    if (empty) {
      emptyRows.add(i);
    }
  }

  for (int j = 0; j < grid[0].length; j++) {
    boolean empty = true;
    for (int i = 0; i < grid.length; i++) {
      if (grid[i][j]==1) {
        empty = false;
      }
    }
    if (empty) {
      emptyCols.add(j);
    }
  }

  println(emptyRows);
  println(emptyCols);
  
  //int[][] grid2 = new int[grid.length + emptyRows.size()][grid[0].length + emptyCols.size()];
  ArrayList<MyPoint> ps = new ArrayList();
  int y = 0;
  for(int i = 0; i < grid.length; i++){
    int x = 0;
    for(int j = 0; j < grid[0].length; j++){
      if(emptyCols.contains(j)){
        x++;
      }
      if(grid[i][j]==1){
        ps.add(new MyPoint(x,y));
      }
      //grid2[y][x] = grid[i][j];
      x++;
    }
    y++;
    if(emptyRows.contains(i)){
    y++;
    }
  }
  //printGrid(grid2);
  int sum = 0;
  println(ps);
  for(int i = ps.size()-1; i>0; i--){
    for(int j = i-1; j>=0; j--){
      sum += ps.get(j).distance(ps.get(i));
    }
  }
  println("answer: "+sum);
  exit();
}

class MyPoint{
  int x,y;
  
  MyPoint(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  int distance(MyPoint b){
    return abs(x - b.x) + abs(y - b.y);
  }
  
  String toString()
  {
    return "("+x+","+y+")";
  }
  
  
}

void printGrid(int[][] grid) {
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j]==1) {
        print('#');
      } else {
        print('.');
      }
    }
    println();
  }
}
