class LoopRunner{
  int dir,x,y,steps;
  boolean done;
  LoopRunner(int _dir, int _y, int _x){
    dir = _dir;
    x = _x;
    y = _y;
    steps = 0;
    done = false;
  }
  
  void update(char pipe){
    switch(pipe){
      case '7':
      if(dir==1){
        dir = 2;
      }else{
        dir = 3;
      }
      break;
      case 'F':
      if(dir==3){
        dir = 2;
      }else{
        dir = 1;
      }
      break;
      case 'L':
      if(dir == 2){
        dir = 1;
      }else{
        dir = 0;
      }
      break;
      case 'J':
        if(dir == 2){
          dir = 3;
        }else{
          dir = 0;
        }
      break;
    }
  }
  
  void step(){
    steps++;
    switch(dir){
      case 0:
      y--;
      break;
      case 1:
      x++;
      break;
      case 2:
      y++;
      break;
      case 3:
      x--;
      break;
    }
  }
  
  String toString(){
    return dir + ","+x+","+y+","+steps+","+done;
  }
}
