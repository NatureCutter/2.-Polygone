import controlP5.*;
import processing.pdf.*;

ControlP5 cp5;
int n;
float r;
float hOben;                  // ist gleich hNutz aus den Notizen
float hUnten;
int k;
float Radius = 200;
int Ecken = 4;
float HoeheOben = 0;
float HoeheUnten = 0;
boolean print = false;
PFont f;


void setup() {

  
  size(800, 760 ); 
  background(235);
  smooth();
  
  f = createFont("helvetica", 14, true);
  textFont(f,16);                 // STEP 4 Specify font to be used
  fill(0);                        // STEP 5 Specify font color 
  text("Press s to save the Polygon",30,110);  // STEP 6 Display Text
  
  cp5 = new ControlP5(this);
  cp5.addSlider("Radius").setPosition(30, 30).setRange(30, 200);
  cp5.addSlider("Ecken").setPosition(30, 50).setWidth(400).setRange(0, 38).setNumberOfTickMarks(38).setSliderMode(Slider.FIX);
  cp5.addSlider("HoeheOben").setPosition(30, 70).setRange(0, 200);
  cp5.addSlider("HoeheUnten").setPosition(30, 90).setRange(0, 200);
}

void draw() {

  background(205);
  
  n = Ecken;
  r = Radius;
  hOben =HoeheOben;
  hUnten = HoeheUnten; 
  
  textFont(f,12);                 // STEP 4 Specify font to be used
  fill(255);                        // STEP 5 Specify font color 
  text("Press s to save the Polygon",30,120);  // STEP 6 Display Text
if (print == true) {
    background(255);
  }
 
   pushMatrix();
   translate(width/2, height/2);
   
float g = r * 2*sin(PI/n);                       //Grundseite der Dreiecke im Polygon
float h = sqrt(sq(r) - sq(g/2));                 //Höhe der Dreiecke im Polygon
float hNeuOben = sqrt(sq(h) + sq(hOben));        //tatsächliche Höhe
float hNeuUnten = sqrt(sq(h) + sq(hUnten));      //tatsächliche Höhe
float winkel = atan((g/2) / hNeuOben);                        //alpha in den Notizen


for (int i=0 ; i<n; i++) {
  pushMatrix();
   rotate(2* winkel * i);
  

  beginShape();

  vertex(0, 0);                        //1 - Spitze
  vertex(-(g/2), hNeuOben);            //2 - links
  vertex(g/2, hNeuOben);               //4 - rechts
  vertex(-(g/2), hNeuOben);            //2 - links

int l = 30;
int lUnten; 
  if (n>6) {
  lUnten = n ; 
  }
  else {
   lUnten = 0; 
  }
  vertex(-(g/2), hNeuOben + l);
  vertex(-l, hNeuOben + hNeuUnten - lUnten );
  vertex(0, hNeuOben + hNeuUnten);
  vertex(-(g/2), hNeuOben);

  vertex(0, hNeuOben + hNeuUnten);     //3 - untere Spitze
  
  vertex(l, hNeuOben + hNeuUnten - lUnten);
  vertex(g/2, hNeuOben + l);
  vertex(g/2, hNeuOben);
  vertex(0, hNeuOben + hNeuUnten);
  
  vertex(g/2, hNeuOben);               //4 - rechts
  vertex(0, 0);                        //1 - Spitze
  
  endShape();
  popMatrix();
}
stroke(0);
   
   
   
   popMatrix();
}

void keyPressed() {
  
  if(key == 's' || key == 'S') {
  print = true;
  }
}

void keyReleased() {
    if(key == 's' || key == 'S') {

 saveFrame("Polygon-####.png");  
  print = false; 
}}


