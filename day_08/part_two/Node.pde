class Node{
  String left;
  String right;
  String name;
  Node(String s){
    name = s.substring(0,3);
    left = s.substring(7,10);
    right = s.substring(12,15);
  }
}
