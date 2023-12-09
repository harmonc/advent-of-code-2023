void setup(){
  String[] strs = loadStrings("input.txt");
  int sum = 0;
  for(int i = 0; i < strs.length; i++){
    sum+=getNext(strs[i]);
  }
  println("answer:"+sum);
}

int getNext(String seq){
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
  int sum = 0;
  for(ArrayList<Integer> lst : ls){
    sum += lst.get(lst.size()-1);
  }
  return sum;
}
