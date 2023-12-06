int[] timesReal = {48,93,84,66};
int[] distsReal = {261,1192,1019,1063};
int[] timesEx = {7,15,30};
int[] distsEx = {9,40,200};
int[] timesEx2 = {71530};
int[] distsEx2 = {940200};
long[] timesReal2 = {48938466};
long[] distsReal2 = {Long.parseLong("261119210191063")};
void setup(){
  long[] times = timesReal2;
  long[] dists = distsReal2;
  long result = 1;
  for(int i = 0; i < times.length; i++){
    long greater = 0;
    for(long hold = 0; hold <= times[i]; hold++){
      if((times[i]-hold)*hold>dists[i]){
        greater++;
      }
    }
    result *= greater;
  }
  println("answer: "+result);
}
