void setup(){
  String[] strs = loadStrings("input.txt");
  String instructs = strs[0];
  println(instructs);
  ArrayList<Node> nodes = new ArrayList();
  for(int i = 2; i < strs.length; i++){
    nodes.add(new Node(strs[i]));
  }
  
  String curr = "AAA";
  int i = 0;
  println(curr);
  while(!curr.equals("ZZZ")){
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
    println(curr);
    i++;
  }
  println("answer: "+i);
}
