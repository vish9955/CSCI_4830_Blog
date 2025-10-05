// ExampleLSystemDesigns - contains helper methods to create and 
// initialize an LSystem
// to set up parameters and init the LSystem (from the main file)

import java.util.HashMap;

// [TODO]: create your own L-System initialization methods
// and use/test in the setup() method of L1LSystemAssignment file. 
// See example for Square Lsystem below.

// Square Lsystem initialization 
// This method returns an Lsystem object that uses
// The rules and axioms for a square based system
LSystem initSquare() {
  // initialize turtle variables
  float moveDist = 10;
  float rotateAngle = 90;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "F+F+F+F";
  
  // Create any production rules
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F+F-F-FF+F+F-F");
    
  // Create and return the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem kochSnowflake() {
  float moveDist = 10;
  float rotateAngle = 120;
  float scaleFactor = 1;
  
  String axiom = "F+F+F";
  
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F_F+F_F");
  
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem branch() {
  float moveDist = 30;
  float rotateAngle = 20;
  float scaleFactor = 0;
  
  String axiom = "F";
  
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F[-FC]F[+F][++FC]");
  rules.put('C', "[_F][--F]");
  
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem tree() {
  float moveDist = 200;
  float rotateAngle = 45;
  float scaleFactor = 0;
  
  String axiom = "F";
  
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F[-BFA][+BFA][BFA]");
  
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

//LSystem spiral() {
//  float moveDist = 20;
//  float rotateAngle = 20;
//  float scaleFactor = 0;
  
//  String axiom = "F";
  
//  HashMap<Character, String> rules = new HashMap<>();
//  rules.put('F', "F[SMMFPP]+MFP");
  
//  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
//}
