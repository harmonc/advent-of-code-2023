import java.util.*; 

class HandComparator implements Comparator<Hand> { 
  
    // override the compare() method 
    public int compare(Hand h1, Hand h2) 
    { 
      if(h1.type < h2.type){
        return 1;
      }else if(h2.type < h1.type){
        return -1;
      }else{
        for(int i = 0; i < h1.cards.length(); i++){
          if(h1.getCardNValue(i) < h2.getCardNValue(i)){
            return 1;
          }else if(h1.getCardNValue(i) > h2.getCardNValue(i)){
            return -1;
          }
        }
      }
      return 0;
    } 
} 
