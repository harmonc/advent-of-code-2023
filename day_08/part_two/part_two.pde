void setup(){
  String[] strs = loadStrings("input.txt");
  String instructs = strs[0];
  println(instructs);
  ArrayList<Node> nodes = new ArrayList();
  for(int i = 2; i < strs.length; i++){
    nodes.add(new Node(strs[i]));
  }
  
  ArrayList<String> currs = new ArrayList();
  for(int i = 0; i < nodes.size(); i++){
    if(nodes.get(i).name.charAt(2)=='A'){
      currs.add(nodes.get(i).name);
    }
  }
  
  printArray(currs);
  
  ArrayList<Integer> answers = new ArrayList();
  
  for(String c: currs){
    String curr = c;
    int i = 0;
    println(curr);
    while(curr.charAt(2)!='Z'){
      for(int j = 0; j < nodes.size(); j++){
        Node n = nodes.get(j);
        if(n.name.equals(curr)){
          if(instructs.charAt(i%instructs.length())=='L'){
            curr = n.left;
          }else{
            curr = n.right;
          }
          break;
        }
      }
      //println(curr);
      i++;
    }
    answers.add(i);
    //println("answer: "+i);
  }
  println("LCM of the array below");
  printArray(answers);
}
