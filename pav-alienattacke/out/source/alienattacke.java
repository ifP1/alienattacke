import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class alienattacke extends PApplet {

Spielfigur sf;
Gegner[] geg = new Gegner[50];
int punkte=0;

public void setup() {
  
  sf = new Spielfigur();
  for (int i = 0; i<geg.length; i++) {
    geg[i]=new Gegner();
  }
  textSize(40);
}

public void draw() {
  background(0);
  sf.anzeigen();
  sf.bewegen();
  for (int i = 0; i<geg.length; i++) {
    geg[i].anzeigen();
    geg[i].attackieren();
    for (int j=i+1; j<geg.length; j++) {
      if (sf.kollision(geg[j])==true) {
        noLoop();
      }
    }
    punkte = punkte + geg[i].punktestand();
    text(punkte,50,100);
  }
}
class Gegner{
  float r, x, y, ySpeed;
  int erfolgloseAttacke=0;
  
  Gegner(){
    setzen();
  }
  
  public void anzeigen(){
    stroke(255);
    fill(255,0,0);
    ellipse(x,y,2*r,2*r);
  }
  
  public void attackieren(){
    erfolgloseAttacke=0;
    y=y+ySpeed;
    x=x+random(-2,2);
    if(y>800+10){
      setzen();
    }
  }
  
  public int punktestand(){
    return erfolgloseAttacke;
    
  }
  
  public void setzen(){
    x=random(width);
    y=-random(height);
    ySpeed=random(2,7);
    r=2;
    erfolgloseAttacke=1;
  }
}
class Spielfigur{
  float x=width/2;
  float y=height*0.8f;
  float r=20;
  
  Spielfigur(){
  }
  
  public void anzeigen(){
    stroke(255);
    fill(125);
    ellipse(x,y,2*r,2*r);
  }
  
  public void bewegen(){
    if(keyPressed){
      if (keyCode==LEFT){
        if(x>0){x=x-5;}
      }
      if (keyCode==RIGHT){
        if(width>x){x=x+5;}
      }
    }
  }
  
  public boolean kollision(Gegner geg) {
    float d = dist(x, y, geg.x, geg.y);
    if(d<=(r+geg.r)/2){
      return true;
    }else{
      return false;
    }
  }
  
}
  public void settings() {  size(1200, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "alienattacke" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
