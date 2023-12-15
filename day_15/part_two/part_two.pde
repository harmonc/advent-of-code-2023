void setup() {
  String[] strs = loadStrings("input.txt");
  ArrayList<ArrayList<Lens>> boxes = new ArrayList();
  for (int i = 0; i < 256; i++) {
    boxes.add(new ArrayList());
  }
  for (int i = 0; i < strs.length; i++) {
    for (String s : strs[i].split(",")) {
      if (s.indexOf("-")>=0) {
        String toRemove = s.split("-")[0];
        //println("remove " + toRemove);
        Lens remove = null;
        for (Lens l : boxes.get(hash(toRemove))) {
          if (l.name.equals(toRemove)) {
            remove = l;
          }
        }
        if (remove != null) {
          boxes.get(hash(toRemove)).remove(remove);
        }
      } else if (s.indexOf("=")>=0) {
        //println("add " + s);
        String[] parts = s.split("=");
        boolean exists = false;
        for (Lens l : boxes.get(hash(parts[0]))) {
          if (l.name.equals(parts[0])) {
            exists = true;
            l.value = int(parts[1]);
          }
        }
        if (!exists) {
          boxes.get(hash(parts[0])).add(new Lens(parts[0], int(parts[1])));
        }
        //printBoxes(boxes);
      } else {
        println("oops!");
      }
    }
  }
  println("Answer: "+getFocusingPower(boxes));
  exit();
}

int getFocusingPower(ArrayList<ArrayList<Lens>> boxes) {
  int result = 0;
  for (int i = 0; i < boxes.size(); i++) {
    for(int j = 0; j < boxes.get(i).size(); j++){
      result += (i+1)*(j+1)*boxes.get(i).get(j).value;
    }
  }
  return result;
}

void printBoxes(ArrayList<ArrayList<Lens>> boxes) {
  for (int i = 0; i < boxes.size(); i++) {
    ArrayList<Lens> lens = boxes.get(i);
    if (lens.size()>0) {
      StringBuilder str = new StringBuilder();
      str.append("Box " + i + ":");
      for (Lens l : lens) {
        str.append(l);
      }
      println(str);
    }
  }
}

class Lens {
  String name;
  int value;
  Lens(String _name, int _value) {
    name = _name;
    value = _value;
  }

  String toString() {
    return "[" + name + " " + value + "] ";
  }
}

int hash(String s) {
  int result = 0;
  for (int i = 0; i < s.length(); i++) {
    int n = int(s.charAt(i));
    result+=n;
    result*=17;
    result = result%256;
  }
  return result;
}
