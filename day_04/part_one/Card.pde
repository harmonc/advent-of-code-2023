class Card{
  String card;
  int[] winningNumbers;
  int[] cardNumbers;
  int points;
  int matches;
  int copies = 0;
  Card(String _s){
    String[] arr = _s.split(":");
    card = arr[0];
    String[] values = arr[1].split("\\|");
    
    String[] winningNumbersStrs = values[0].replace("  "," ").trim().split(" ");
    String[] cardNumbersStrs = values[1].replace("  "," ").trim().split(" ");
    winningNumbers = new int[winningNumbersStrs.length];
    cardNumbers = new int[cardNumbersStrs.length];
    for(int i = 0; i < winningNumbersStrs.length; i++){
      winningNumbers[i] = int(winningNumbersStrs[i]);
    }
    for(int i = 0; i < cardNumbersStrs.length; i++){
      cardNumbers[i] = int(cardNumbersStrs[i]);
    }
  }
  
  void display(){
    println(card);
    updatePoints();
    updateMatches();
    println(matches);
  }
  
  void addCopies(int n){
    this.copies += n;
  }
  
  void updatePoints(){
      points = getPoints();
  }
  
  void updateMatches(){
    matches = getMatches();
  }
  
  boolean inWinningNumbers(int num){
    for(int i = 0; i < winningNumbers.length; i++){
      if(num==winningNumbers[i]){
        return true;
      }
    }
    return false;
  }
  
  int getMatches(){
    int result = 0;
    for(int i = 0; i < cardNumbers.length; i++){
      if(inWinningNumbers(cardNumbers[i])){
        result++;
      }
    }
    return result;
  }
  
  int getPoints(){
    int result = 0;
    for(int i = 0; i < cardNumbers.length; i++){
      if(inWinningNumbers(cardNumbers[i])){
        if(result == 0){
          result = 1;
        }else{
          result = result * 2;
        }
      }
    }
    return result;
  }
  
  void printArr(int[] arr){
    for(int i = 0; i < arr.length-1; i++){
      print(arr[i]+",");
    }
    print(arr[arr.length-1]+"\n");
  }
}
