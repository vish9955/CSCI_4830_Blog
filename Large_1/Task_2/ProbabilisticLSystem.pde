import java.util.HashMap;

class ProbabilisticLSystem extends BaseLSystem {

  // Production rules
  private HashMap<Character, String[]> rules;

  // Constructor for making an Lsystem object
  public ProbabilisticLSystem(String axiom, HashMap<Character, String[]> rules,
    float moveDistance, float rotateAngle, float scaleFactor) {

    // Call Super Class constructor to initialize variables
    // You must always call this.
    super(axiom, moveDistance, rotateAngle, scaleFactor);

    // Set the Rules
    this.rules = rules;

    // Reset the state
    this.reset();
  }

  // runs 1 iteration, performing the rules for each character
  // on the current string. The result of the replacement is added to the currentIterationBuffer.
  public void iterate() {
    // get a copy of the current iteration string
    String current = this.getIterationString();

    // Now clear the current interation string
    this.clearCurrentStringBuffer();

    for (int i = 0; i < current.length(); i++) {
      Character c = current.charAt(i);
      String[] def = {str(c)};
      String[] output = rules.getOrDefault(c, def);
      int rand = int(random(0,output.length));
      this.addToBuffer(output[rand]);
    }


    // Increment our iteration after we are done
    iterationNum += 1;
  }

  // This function uses the turtle to draw based on each character in the LSystem's
  // iteration string. It also handles scaling the moveDistance (to keep the image in frame), if desired
  public void drawLSystem(Turtle t) {
    // Our turtle's move distance
    float dist = this.moveDistance;
    float angle = this.rotateAngle;
    // Scale the movement, if necessary, to help keep the image in frame
    // when it gets too big
    if (scaleFactor != 0) {
      // Get the current iteration number for scaling
      int iterationNum = this.getIterationNum();
      dist = dist / (scaleFactor * (iterationNum + 1));
    }

    // Get the current iteration string
    String currentIteration = this.getIterationString();

    // [TODO]: Loop through each character in the iteration string,
    // and do turtle operations based on the character
    for (int i = 0; i < currentIteration.length(); i++) {
      Character c = currentIteration.charAt(i);
      // [TODO]: Implement different l-system vocabulary
      switch (c) {
      case 'F':
        t.forward(dist+random(-10, 50));
        break; // The "break" exits out of the switch statement and prevents the next cases from running
      case 'G':
        t.forward(dist);
        break;
      case '+':
        t.left(random(10, angle));
        break;
      case '-':
        t.right(random(10, angle)-10);
        break;
      case '_':
        t.right(angle);
        break;
      case '=':
        t.left(angle);
      case '[':
        t.push();
        break;
      case ']':
        t.pop();
        break;
      case 'C':
        circle(t.getX(), t.getY(), 10);
        break;
      case 'B':
        dist  = (dist *2/3);
        break;
      case 'A':
        dist = (dist * 3/2);
        break;
      //case 'S':
      //  t.right(90-angle/2);
      //  break;
      //case 'M':
      //   dist -= 2;
      //   angle +=5;
      //   break;
      //case 'P':
      //  angle -=5;
      //  dist += 2;
      //  break;
      default:
        // Throw an error if we don't have a draw operation implemented
        throw new IllegalArgumentException("Missing a drawing operation case for character: " + c.toString());
      }
    }
  }
}
