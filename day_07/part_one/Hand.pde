class Hand{
  String cards;
  int bid;
  int type;
  char[] faces = {'A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2'};
  Hand(String str){
    String[] arr = str.split(" ");
    cards = arr[0];
    bid = int(arr[1]);
    determineType();
  }
  
  int getCardNValue(int n){
    if(n >= cards.length() || n < 0){
      return 99;
    }else{
      char c = cards.charAt(n);
      for(int i = 0; i < faces.length; i++){
        if(c == faces[i]){
          return i;
        }
      }
    }
    return 99;
  }
  
  void determineType(){
    int[] faceCount = new int[faces.length];
    for(int i = 0; i < faceCount.length; i++){
      for(int j = 0; j < cards.length(); j++){
        if(cards.charAt(j)==faces[i]){
          faceCount[i]++;
        }
      }
    }
    ArrayList<Integer> finalCount = new ArrayList();
    for(int i = 0; i < faceCount.length; i++){
      if(faceCount[i]!=0){
        finalCount.add(faceCount[i]);
      }
    }
    switch(finalCount.size()){
      case 1:
      //Five of a kind
      type = 0;
      break;
      case 2:
      //Four of a kind or Full House
      if(finalCount.contains(4)){
        type = 1;  
      }else{
        type = 2;
      }
      break;
      case 3:
      //Three of a kind or two pair
      if(finalCount.contains(3)){
        type = 3;
      }else{
        type = 4;
      }
      break;
      case 4:
      //one pair
      type = 5;
      break;
      case 5:
      //high card
      type = 6;
      break;
      default:
        println("oops something went wrong!");
      break;
    }
  }
  
  String toString(){
    String[] handTypes = {"Five of a kind","Four of a kind","Full house","Three of a kind","Two pair","One pair","High card"};
    return cards + " " + bid + " " + handTypes[type];
  }
}
