# Final Report

### What is this?

The goal of this project is to create generated vasculature from a central object, representing a heart. This generation should be roughly bounded by an outer shell and generation cannot exceed inner or outer walls. The vessels will be represented by cylinders, which will generate away from the central point. Although previous research has generated vessel models, these models were constructed with fluid mechanics and outside the scope of this project. For example, "Simulation of angiogenesis in three dimensions: Application to cerebral cortex" by Alberding et al. showed 3D generation using fluid mechanics. While the final product is not realistic to a human body, it creates a base from which random 3D generation can occur. The final product contains randomly generated lines which first expand upwards then down the z-axis, allowing for the input of a bounding shape and control of various parameters, as described below.

### How does it Work?

The intake parameters are as follows: the bounding shape, z-axis of the bounding box, recursion times (how many times to repeat recursion), and splitting parameter (a decimal which represents the probability that the vessel will branch). These parameters are taken into the RecGenRandom function (see the code documentation for more details), which then generates x and y coordinates randomly while bounding the z-coordinates to generate first upwards, then down. After points reach past the central components, generation of the x and y components turns in. If a generation is out of bounds, the generation repeats until an in-bound point is found, or the branch is disconnected if the branch is not able to be generated in 20 tries. This code has implemented fail safes after crashing Rhino tens of times, such as the timer for looping and ending recursive generation after a given parameter. 

![Final_Project/Parameters.PNG](/CSCI_4830_Blog/Final_Project/Parameters.PNG)

This entire function is run twice to generate veins and arteries, after which both are passed into a multi-pipe function, with arteries being thicker to mimic anatomical muscle. The design is then closed to create a solid Brep, sliced, and layed onto the xy plane similar to in L2. A rotational component was added for one slice to create yz slices rather than xy.

### Reflection

Overall, this result was very similar to my desired end goal. I did have to scrap some of the functionalities, such as connecting veins and arteries, as this would make the product look very messy. In addition, having the size of vessels decrease was difficult with the pipe function as I couldn't figure out how to separate the product of the function into which radii I wanted. However, the vessel generation was achieved. Random point generation was easier than expected and took less time than I anticipated. However, bounding shapes was more challenging because of my unfamiliarity with python (see Troubleshooting section). If I had more time, I would smooth the lines of generation to more closely follow fluid flow (the twisting paths currently are cool but excessively unrealistic) and tune the bounding parameters. The bounding shape only works for shapes similar to the size I have used, which I'm not sure of the reason for but assume have to do with my vector calculation functions including some random numbers. Next time, I would put more time into creating functions to clear up the code. Currently, there's a decent amount of repetitive code which could be functionalized, but doing so after getting everything working would needlessly introduce bugs.

#### The output

For simplicity, the bounding shapes are reserved to boxes (80x80 mm and 60x60 mm), cylinders (similar dimensions to the boxes), and a sphere (30 mm radius). These outputs are shown below in this order.

![Final_Project/BB30.PNG](/CSCI_4830_Blog/Final_Project/BB30.PNG)
![Final_Project/BB40.PNG](/CSCI_4830_Blog/Final_Project/BB40.PNG)
![Final_Project/Cylinder30.PNG](/CSCI_4830_Blog/Final_Project/Cylinder30.PNG)
![Final_Project/Cylinder40.PNG](/CSCI_4830_Blog/Final_Project/Cylinder40.PNG)
![Final_Project/Sphere30.PNG](/CSCI_4830_Blog/Final_Project/Sphere30.PNG)

#### Fabrication

The slices were converted to SVG files, then laser cut in wood and acrylic to show different properties. Initially, a cut of all the vessels was desired as this would show continuation through the slices. However, due to the size of vessels and amount of time required to create the cuts, an engrave option was chosen. The 60x60 (sliced yz) and 80x80 (sliced xy) bounding boxes were fabricated, with SVG images and final output shown below.

The outputs do not show the level of detail I had hoped; however, this fabrication method still made the most sense for this project. I think due to to the random walk behavior, the correlation through a single line was hard to see over multiple cuts.

##### 80x80 (xy sliced, wooden cut)

![Final_Project/Wooden_Cut.PNG](/CSCI_4830_Blog/Final_Project/Wooden_Cut.PNG)
![Final_Project/IMG_7863.jpg](/CSCI_4830_Blog/Final_Project/IMG_7863.jpg)
![Final_Project/IMG_7862.jpg](/CSCI_4830_Blog/Final_Project/IMG_7862.jpg)

##### 60x60 (yz sliced, acrylic cut)

![Final_Project/Acrylic_Cut.PNG](/CSCI_4830_Blog/Final_Project/Acrylic_Cut.PNG)
![Final_Project/IMG_7864.jpg](/CSCI_4830_Blog/Final_Project/IMG_7864.jpg)

### Previous versions and failed paths

Initially, generation was done to two points in the RecGen function (see code documentation). This bounds x,y generation to two points which are inputted into the function, as seen in the images below. However, this code had one major limitation: generation was limited to the two points and did not appear to fill the given space. Thus, a more random component was used for the final product.

One goal which I had hoped to implement and did not was having the arteries connect to the veins through capillaries. This would have been accomplished by calculating the distance between each final point and connecting the closest ones; however, after generation had occured, I believed adding another layer of lines would make the product unrecognizable in its desired form. In addition, implementing a shifting center point seemed obsolete in the code itself as this could easily be accomplished with a grasshopper move function.

A path which I pursued but ultimately ended up dropping was to modify vessel diameter by their distance to the center. While I was able to make a 2D list with the recursion time and the lines, I couldn't figure out how to extract information from this list in Grasshopper.

#### Troubleshooting

Bounding was intially conducted with the WithinBounds function, where I manually input dimensions to ensure functionality. However, as I switched to other functions, the code would error. Eventually, I discovered this was due to the type casting of the function. As I had only worked with more strongly typed languages before this class, I did not realize that I had to tell the function to return true or false explicitly, or type errors would occur.

![Final_Project/Bounding.PNG](/CSCI_4830_Blog/Final_Project/Bounding.PNG)

#### Generation with two points (30,30,-30) and (0,0,-30)
![Final_Project/Mid_1.PNG](/CSCI_4830_Blog/Final_Project/Mid_1.PNG)
#### Generation with two points (20,20,-20) and (0,0,-30)
![Final_Project/Mid_0.PNG](/CSCI_4830_Blog/Final_Project/Mid_0.PNG)

<!-- ### The code

Essentially, this code generates lines recursively towards two points. Once the point is reached, the points change to the same point. Line generation is governed by a certain amount of randomness as well as the 3D distance between the starting and ending points. -->

#### RecGen Code

![Final_Project/Mid_2.PNG](/CSCI_4830_Blog/Final_Project/Mid_2.PNG)
![Final_Project/Mid_3.PNG](/CSCI_4830_Blog/Final_Project/Mid_3.PNG)

<!-- ### Next Steps (in no particular order)

1. Make less lines
2. Create cylinders instead of lines
3. Connect the lines on either side which are closest to each other
4. Smooth the corners
5. Bounding box
6. No line overlap
7. Fine tune angles of generation

Anything else? -->

# Documentation

![Final_Project/Grasshopper_Screenshot.PNG](/CSCI_4830_Blog/Final_Project/Grasshopper_Screenshot.PNG)

[Grasshopper_File](/CSCI_4830_Blog/Final_Project/Vessels_V1.gh)
[Final_Project_Folder](https://github.com/vish9955/CSCI_4830_Blog/tree/main/Final_Project)

<script src="https://gist.github.com/vish9955/2eb1eb4ae4c4148977d942406441ff3c.js"></script>


