void setup(){
  String[] strs = loadStrings("input.txt");
  String file = "";
  for(int i = 0; i < strs.length; i++){
    file += strs[i]+"\n";
  }
  String[] arr = file.split("\n\n");
  String[] seedStrs = arr[0].split(":")[1].trim().split(" ");
  long[] seeds = new long[seedStrs.length];
  for(int i = 0; i < seedStrs.length; i++){
    seeds[i] = Long.parseLong(seedStrs[i]);
  }
  
  ArrayList<MyRange> ranges = new ArrayList();
  
  for(int i = 0; i < seeds.length; i+=2){
    ranges.add(new MyRange(seeds[i],seeds[i]+seeds[i+1]));
  }
  
  for(MyRange r: ranges){
    r.display();
  }
  
  for(int i = 1; i < arr.length; i++){
    String[] mapStrs = arr[i].split("\n");
    MyMap[] maps = new MyMap[mapStrs.length-1];
    for(int j = 1; j < mapStrs.length; j++){
      maps[j-1] = new MyMap(mapStrs[j]);
    }
    
    ArrayList<MyRange> mapped;
    //for(int k = 0; k < seeds.length; k++){
    //  long newSeed = MapSeed(seeds[k],maps);
    //  seeds[k] = newSeed;
    //}
  }
  
  //long min = seeds[0];
  //for(int i = 1; i < seeds.length; i++){
  //  if(seeds[i] < min){
  //    min = seeds[i];
  //  }
  //}
  //println("answer:"+min);
}

long MapSeed(long seed, MyMap[] maps){
  for(int i = 0; i < maps.length; i++){
    if(maps[i].inRange(seed)){
      return maps[i].mapNum(seed);
    }
  }
  return seed;
}
