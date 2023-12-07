void setup(){
  String[] strs = loadStrings("input.txt");
  ArrayList<Hand> hands = new ArrayList();
  for(int i = 0; i < strs.length; i++){
    hands.add(new Hand(strs[i]));
  }
  
  Collections.sort(hands, new HandComparator()); 
  
  int result = 0;
  int rank = 1;
  for(Hand hand: hands){
    println(hand + " " + rank);
    result += rank*hand.bid;
    rank++;
  }
  println("answer part 1: " + result);
}
