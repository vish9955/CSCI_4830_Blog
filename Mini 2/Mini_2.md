# Mini 2 - Laser Cutting

### 1. Rotating Stars

The goal of this design was to create a series of rotated stars with decreasing lengths. This was created by using turtle to create each star, resetting it to the center, then rotating and creating the next star in the same way. First, a single point was created, of which angles were estimated and adjusted based on the result. Each point had to be rotated 36 degrees to the next point (calculated using the geometry of a pentagon). Then, lengths were determined by estimation and a whole star was generated. Geometric calculations has to be done in order to offset each star to a single center (as the design began drawing on one point). Then, lengths were decremented in a loop and the final product was created. During laser cutting, a pentagon was added to enhance the design, and it is important to note that the cut was not completely consistent with the generated design but was consistent with the svg file (the generated picture and svg file were not the same). It is not completely clear why this occured.

![Mini 2/Images/Star_Laser.jpg](/Mini%202/Images/Star_Laser.jpg)
![Mini 2/Images/indmill.PNG](/Mini%202/Images/indmill.PNG)
<script src="https://gist.github.com/vish9955/c2ff85bd814d036ac7e367b73b07ece0.js"></script>
![Windmill_Calculations.jpeg](/Mini%202/Images/Windmill_Calculations.jpeg)

### 2. Landscape
This design mimicks a watercolor landscape, created using sine waves with a random length. First, a function was created to set the y value of each line using the sine function, passing in the x value and desired sine wave length. A line was drawn from the bottom of the screen to the value, then repeated for the whole sine wave. Then, this pattern was repeated across the screen. The length value was randomized, then a wave was repeated with lower height values each time, incrementing the x values to not overlap the lines.

![Mini 2/Images/Landscape_Picture.PNG](/Mini%202/Images/Landscape_Picture.PNG)
<script src="https://gist.github.com/vish9955/313b674ee421aba9a88f0fd38c5a883a.js"></script>
### 3. Recursion Tree
This idea came about from one of the fundamental data structures - a binary search tree. First, the inside of the tree was created with recursion using turtle. The turtle would create the original branch through the right side, store each branch point, then create branches towards the left. Initially, the angle and branch length were constant, and the recursion started small with 3 branches. Then, the stroke width was adjusted to decrease as the branches grew further from the origin and randomized angles were added. As the branches grew farther from the center, they became less and less ordered, so the angle was decreased with increasing recursion value. In addition, the length was decremented with distance. Each of these values were changed until the result appeared to resemble the branches of a tree.
The outside of the tree was created by drawing circles with centers along the circumference of a larger circle (using trigonometry and for loops). Then, this larger circle was drawn in black with a black fill. Then, a quadrilateral was drawn as the trunk and put before the circle, giving the illusion of a tree outline. During laser cutting, the smaller branches got omitted, and the outline of the tree was slightly modified (which was imported as a seperate file cut onto the engraving). It is unclear why this occured, but the designs were similar.

![Mini 2/Images/Tree_Laser.jpg](/Mini%202/Images/Tree_Laser.jpg)
![Mini 2/Images/Tree_BW.PNG](/Mini%202/Images/Tree_BW.PNG)
<script src="https://gist.github.com/vish9955/30e3f261c4ba5b806c0c3e97384613d5.js"></script>