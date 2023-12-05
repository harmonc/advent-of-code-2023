ArrayList<Card> cards;

void setup(){
  cards = new ArrayList();
  String[] strs = loadStrings("input.txt");
  for(int i = 0; i < strs.length; i++){
    cards.add(new Card(strs[i]));
  }
  //int sum = 0;
  //for(Card c: cards){
  //  c.display();
  //  sum += c.points;
  //}
  //println("answer: "+sum);
    for(int i = 0; i < cards.size(); i++){
      Card card = cards.get(i);
      card.updateMatches();
      println(card.matches);
      for(int j = 1; j <= card.matches; j++){
        cards.get(i+j).addCopies(card.copies + 1);
      }
    }
    
    int sum = 0;
    for(int i = 0; i < cards.size(); i++){
      sum += cards.get(i).copies + 1;
    }
    println("answer:"+sum);
}
