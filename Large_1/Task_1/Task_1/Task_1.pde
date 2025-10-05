import Turtle.*;
import processing.svg.*;
Turtle t;

int x = 0;

void setup(){
  size(700, 700);
  background(0);
  strokeWeight(3);
  noLoop();
  t = new Turtle(this);
  stroke(255);
}

void draw(){
  stroke(255);
  draw_pent(200);
}
void draw_T() {
  //background(0);
  println("draw_t");
  t.penUp();
  t.goToPoint(width/4, height/6);
  t.penDown();
  t.right(90);
  t.forward(width/2);
  t.penUp();
  t.goToPoint(width/2, height/6);
  t.right(90);
  t.penDown();
  t.forward(2*height/3);
  t.penUp();
  t.left(180);
  t.goToPoint(width/2,height/2);
}
void draw_I() {
  draw_T();
  t.goToPoint(width/4,5*height/6);
  t.right(90);
  t.penDown();
  t.forward(width/2);
  t.penUp();
  t.goToPoint(width/2, height/2);
  t.left(90);
}
void draw_tri(int r){
  background(0);
  t.penUp();
  t.goToPoint(width/2,height/2 - sqrt(3)/4*r);
  t.right(150);
  t.penDown();
  for(int i = 0; i < 3; i++){
    t.forward(r);
    t.right(120);
  }
  t.penUp();
  t.left(30);
  t.goToPoint(height/2, width/2);
}
void draw_pent(int r){
  background(0);
  t.penUp();
  t.goToPoint(width/2-r*sin(radians(54)), height/2);
  t.penDown();
  t.right(54);
  for(int i = 0; i < 5; i++){
    t.forward(r);
    t.right(72);
  }
  t.penUp();
  t.left(49);
  t.goToPoint(width/2, height/2);
}
void draw_circle(int r){
  background(0);
  t.penUp();
  t.goToPoint(width/2-r, height/2);
  t.penDown();
  
  for(int i = 0; i < 360; i++){
    t.forward(2*PI*r/360);
    t.right(1);
  }
  t.penUp();
  t.goToPoint(width/2, height/2);
}
void keyPressed() { 
  if (key == 'i') {draw_I();}
  if (key == 't') {draw_T();}
  if (key == '3') {draw_tri(200);}
  if (key == 'c') {draw_circle(200);}
}
