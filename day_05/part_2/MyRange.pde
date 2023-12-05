class MyRange{
  long start; //inclusive
  long end; //exclusive
  MyRange(long start, long end){
    this.start = start;
    this.end = end;
  }
  
  void display(){
    println("["+start+","+end+")");
  }
}
