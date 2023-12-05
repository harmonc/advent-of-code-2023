class MyMap{
  long dest;
  long src;
  long r;
  MyMap(String s){
    String[] arr = s.trim().split(" ");
    dest = Long.parseLong(arr[0]);
    src = Long.parseLong(arr[1]);
    r = Long.parseLong(arr[2]);
  }
  
  boolean inRange(long num){
    return num>=src && num<src+r;
  }
  
  long mapNum(long num){
    return dest + (num - src);
  }
}
