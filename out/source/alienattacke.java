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

GameLogic gameLogic;

public void setup() {

    // Scene Setup
    background(0, 0, 0, 1);
    

    // Init
    gameLogic = new GameLogic(new SpaceShip(0, height, 50, 50, 10));
    println("Hello World!");
}

public void draw() {
    clear();
    if(keyPressed){
        gameLogic.compute(keyCode);
    }

    gameLogic.draw();
}
public class Actor {

    protected float sizeX;
    protected float sizeY;
    protected float xPos;
    protected float yPos;
    protected float xVelocity;

    public Actor (float xPos, float yPos, float sizeX, float sizeY, float xVelocity) {
        this.xPos = xPos;
        this.yPos = yPos;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.xVelocity = xVelocity;

        this.checkXPos();
    }

    public Actor(float xPos, float yPos, float sizeX, float sizeY){
        this(xPos,yPos,sizeX,sizeX,10);
    }

    public Actor(){
        this(0, height, 50, 50, 10);
    }

    public void draw(){
        ellipse(xPos, yPos, sizeX, sizeY);
    }

    public void move(float x, float y) {
        this.moveX(x);
        this.moveY(y);
    }

    public void moveX(float x){
        this.xPos += x * this.xVelocity;
        this.checkXPos();

    }

    public void moveY(float y) {
        this.yPos += y;
    }

    public void checkXPos() {
        float leftBoundrary = sizeX / 2;
        float rightBoundrary = width - sizeX / 2;
        if(this.xPos <= leftBoundrary){
            this.xPos = leftBoundrary;
        } else if (this.xPos >= rightBoundrary) {
            this.xPos = rightBoundrary;
        }
        
    }
}
public class GameLogic {

    SpaceShip spaceShip;

    public GameLogic (SpaceShip spaceShip) {
        this.spaceShip = spaceShip;
    }

    public void compute(int keyCode){
        spaceShip.moveArrow(keyCode);
    }

    public void draw(){
        spaceShip.draw();
    }
    
    private void collide() {
    }
}
public class SpaceShip extends Actor {

    public SpaceShip (float xPos, float yPos, float sizeX, float sizeY, float xVelocity) {
        this.xPos = xPos;
        this.yPos = yPos;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.xVelocity = xVelocity;
    }

    public SpaceShip(){
        super();
    }

    public void moveArrow(int keyCode) {
        this.moveVertArrow(keyCode);
        this.moveHoriArrow(keyCode);
    }

    public void moveHoriArrow(int keyCode) {
        if(keyCode == LEFT){
            this.moveX(-1);
        } else if (keyCode == RIGHT){
            this.moveX(1);
        }
    }

    public void moveVertArrow(int keyCode){
        if(keyCode == UP){
            this.moveY(-1);
        } else if (keyCode == DOWN){
            this.moveY(1);
        }
    }

}
  public void settings() {  size(200, 200, OPENGL); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "alienattacke" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
