void setup() {
  String[] strs = loadStrings("input.txt");
  ArrayList<char[]> grid = new ArrayList();
  for (int i = 0; i < strs.length; i++) {
    grid.add(strs[i].toCharArray());
  }
  //printGrid(grid);

  int moved = 1;
  while (moved != 0) {
    moved = 0;
    for (int i = 1; i < grid.size(); i++) {
      for (int j = 0; j < grid.get(i).length; j++) {
        char c = grid.get(i)[j];
        char a = grid.get(i-1)[j];
        if (c=='O' && a=='.') {
          grid.get(i)[j]='.';
          grid.get(i-1)[j]='O';
          moved++;
        }
      }
    }
    //printGrid(grid);
  }
  
  int sum = 0;
  for(int i = 0; i < grid.size(); i++){
    for(int j = 0; j < grid.get(i).length; j++){
      if(grid.get(i)[j]=='O'){
        sum += grid.size() - i;
      }
    }
  }
  println("Answer: " + sum);
}

void printGrid(ArrayList<char[]> grid) {
  println();
  for (char[] chars : grid) {
    for (char c : chars) {
      print(c);
    }
    println();
  }
}
