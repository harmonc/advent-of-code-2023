int redMax = 12;
int greenMax = 13;
int blueMax = 14;
int[] power = {0,0,0};
void setup(){
  String[] strs = loadStrings("input.txt");
  int sum = 0;
  for(int i = 0; i < strs.length; i++){
    sum +=test2(strs[i]);
  }
  println(sum);
}


int test(String s){
  String[] arr = s.split(":");
  int game = int(arr[0].split(" ")[1]);
  String[] sets = arr[1].split(";");
  for(int i = 0; i < sets.length; i++){
    if(!checkSet(sets[i])){
      return 0;
    }
  }
  return game;
}

void checkSet2(String set){
  String[] cubes = set.trim().split(", ");
  for(int i = 0; i < cubes.length; i++){
    String[] cube = cubes[i].split(" ");
    int index = 0;
    switch(cube[1]){
      case "green":
        index = 0;
      break;
      case "red":
        index = 1;
      break;
      case "blue":
        index = 2;
      break;
    }
    if(int(cube[0])>power[index]){
      power[index] = int(cube[0]);
    }
  }
}

int test2(String s){
  power[0] = 0;
  power[1] = 0;
  power[2] = 0;
  String[] arr = s.split(":");
  String[] sets = arr[1].split(";");
  for(int i = 0; i < sets.length; i++){
    checkSet2(sets[i]);
  }
  return power[0] * power[1] * power[2];
}

boolean checkSet(String set){
  String[] cubes = set.trim().split(", ");
  for(int i = 0; i < cubes.length; i++){
    String[] cube = cubes[i].split(" ");
    int max = 0;
    switch(cube[1]){
      case "green":
        max = greenMax;
      break;
      case "red":
        max = redMax;
      break;
      case "blue":
        max = blueMax;
      break;
    }
    if(int(cube[0])>max){
      return false;
    }
  }
  return true;
}
