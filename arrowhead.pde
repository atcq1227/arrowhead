String init = "F";
int recursLim = 5;
float angle = 60;
float len = 400;

ArrayList<Character> sequence = new ArrayList<Character>();
ArrayList<String> grammar = new ArrayList<String>();

void setup() {
  size(800,600);
  
  //add first iteration of sequence
  for(int i = 0; i < init.length(); i++) {
    sequence.add(init.charAt(i));
  }
  
  //define grammar
  grammar.add("G-F-G");
  
  grammar.add("F+G+F");
}

void draw() {
  
  noLoop();
  
  applyGrammar();
}

void applyGrammar() {
  //arbitrary color
  float r = 100;
  
  //loop that creates new sequences to apply grammar to recursively
  for(int i = 0; i < recursLim; i++) {
    ArrayList<Character> tempSequence = new ArrayList<Character>();
    
    int currentLen = sequence.size();
    
    for(int j = 0; j < currentLen; j++) {
      if(sequence.get(j) == 'F') {
        for(int k = 0; k < grammar.get(0).toCharArray().length; k++) { 
          tempSequence.add(grammar.get(0).toCharArray()[k]);
        }
      }
      
      if(sequence.get(j) == 'G') {
        for(int k = 0; k < grammar.get(1).toCharArray().length; k++) { 
          tempSequence.add(grammar.get(1).toCharArray()[k]);
        }
      }
      
      if(sequence.get(j) =='-' || sequence.get(j) == '+') {
        tempSequence.add(sequence.get(j));
      }
    }
    
    sequence = tempSequence;
  }
  
  translate(width/2, height/2);
  
  for(int i = 0; i < sequence.size(); i++) {
    if(sequence.get(i) == 'F' || sequence.get(i) == 'G') {
      fill(r, 0, 0);
      stroke(10);
      line(0, 0, 0, -len);
      translate(0, -len);
    }
    
    if(sequence.get(i) == '+') {
      rotate(-angle);
    }
    
    if(sequence.get(i) == '-') {
      rotate(angle);
    }
  }
}