void setup(){
  String[] strs = loadStrings("input.txt");
  int sum = 0;
  for(int i = 0; i < strs.length; i++){
    sum+=getPrev(strs[i]);
  }
  println("answer:"+sum);
}

int getPrev(String seq){
  String[] nums = seq.trim().split(" ");
  ArrayList<Integer> curr = new ArrayList();
  for(int i = 0; i < nums.length; i++){
    curr.add(int(nums[i]));
  }
  ArrayList<ArrayList<Integer>> ls = new ArrayList();
  boolean zero = false;
  ArrayList<Integer> diffs = new ArrayList();
  ls.add(curr);
  while(!zero){
    zero = true;
    for(int i = 0; i < curr.size()-1; i++){
      int diff = curr.get(i+1)-curr.get(i);
      if(diff!=0){
        zero = false;
      }
      diffs.add(diff);
    }
    ls.add(diffs);
    curr = diffs;
    diffs = new ArrayList();
  }
  int[] prevs = new int[ls.size()];
  for(int i = ls.size()-2; i >= 0; i--){
    prevs[i] = ls.get(i).get(0) - prevs[i+1];
  }
  return prevs[0];
}
