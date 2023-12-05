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
  
  boolean inRange(MyRange range){
    return !(range.end<=src || range.start>=(src+r));
  }
  
  MyRange rangeInRange(MyRange range){
   long start = src;
   long end = src + r;
   if(range.start > src){
     start = range.start;
   }
   if(range.end < end){
     end = range.end;
   }
   return new MyRange(start, end);
  }
  
  ArrayList<MyRange> rangeOutOfRange(MyRange range){
    ArrayList<MyRange> list = new ArrayList();
    if(range.start < src){
      list.add(new MyRange(range.start,src));
    }
    if(range.end > src+r){
      list.add(new MyRange(src+r,range.end));
    }
    return list;
  }
  
  MyRange mapRange(MyRange range){
    long start = (range.start-src)+dest;
    long end = (range.end-range.start)+start;
    return new MyRange(start,end);
  }
  
  long mapNum(long num){
    return dest + (num - src);
  }
}
