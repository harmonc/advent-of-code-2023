void setup() {
  String[] strs = loadStrings("input.txt");
  ArrayList<char[]> grid = new ArrayList();
  for (int i = 0; i < strs.length; i++) {
    grid.add(strs[i].toCharArray());
  }

  ArrayList<String> gridHashes = new ArrayList();
  ArrayList<Integer> scores = new ArrayList();
  boolean go = true;
  int cycle = 0;
  int start = 0;
  while (go) {


    for (int i = 0; i<4; i++) {
      rollGrid(grid);
      grid = rotateGrid(grid);
    }

    String hash = hashGrid(grid);
    if (gridHashes.contains(hash)) {
      go = false;
      start = gridHashes.indexOf(hash);
      cycle = gridHashes.size() - gridHashes.indexOf(hash);
    }
    gridHashes.add(hash);
    scores.add(scoreGrid(grid));

    println(scoreGrid(grid)+","+hashGrid(grid));
  }
  println(cycle);
  println(start);
  println(scores.get(start + (1000000000-start-1)%cycle));
  exit();
}

String hashGrid(ArrayList<char[]> grid) {
  StringBuilder result = new StringBuilder();
  for (int i = 0; i < grid.size(); i++) {
    for (int j = 0; j < grid.get(i).length; j++) {
      result.append(grid.get(i)[j]);
    }
  }
  return result.toString();
}

int scoreGrid(ArrayList<char[]> grid) {
  int sum = 0;
  for (int i = 0; i < grid.size(); i++) {
    for (int j = 0; j < grid.get(i).length; j++) {
      if (grid.get(i)[j]=='O') {
        sum += grid.size() - i;
      }
    }
  }
  return sum;
}

void rollGrid(ArrayList<char[]> grid) {
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
  }
}

ArrayList<char[]> rotateGrid(ArrayList<char[]> grid) {
  ArrayList<char[]> newGrid = new ArrayList();
  for (int i = 0; i < grid.get(0).length; i++) {
    char[] newRow = new char[grid.size()];
    for (int j = 0; j < grid.size(); j++) {
      newRow[j] = grid.get(grid.size()-1-j)[i];
    }
    newGrid.add(newRow);
  }
  return newGrid;
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
