# Mid-Progress Report

### What is this?

The goal of this project is to create generated vasculature from a central object, representing a heart. This generation should be roughly bounded by an outer shell and generation cannot exceed inner or outer walls. The vessels will be represented by cylinders, which will decrease with distance from the center point.

### Where are we now?

#### Generation with two points (30,30,-30) and (0,0,-30)
![Final_Project/Mid_1.PNG](/CSCI_4830_Blog/Final_Project/Mid_1.PNG)
#### Generation with two points (20,20,-20) and (0,0,-30)
![Final_Project/Mid_0.PNG](/CSCI_4830_Blog/Final_Project/Mid_0.PNG)

### The code

Essentially, this code generates lines recursively towards two points. Once the point is reached, the points change to the same point. Line generation is governed by a certain amount of randomness as well as the 3D distance between the starting and ending points.

![Final_Project/Mid_2.PNG](/CSCI_4830_Blog/Final_Project/Mid_2.PNG)
![Final_Project/Mid_3.PNG](/CSCI_4830_Blog/Final_Project/Mid_3.PNG)

### Next Steps (in no particular order)

1. Make less lines
2. Create cylinders instead of lines
3. Connect the lines on either side which are closest to each other
4. Smooth the corners
5. Bounding box
6. No line overlap
7. Fine tune angles of generation

Anything else?
