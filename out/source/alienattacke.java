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
    gameLogic = new GameLogic(new SpaceShip(0, height, 50, 50, 10), 50);
    println("Hello World!");
}

public void draw() {
    clear();
    gameLogic.compute(keyCode, keyPressed);
    gameLogic.draw();
}
public class Actor {

    protected float sizeX;
    protected float sizeY;
    protected float xPos;
    protected float yPos;
    protected float xVelocity;
    protected float yVelocity = 5;

    public Actor (float xPos, float yPos, float sizeX, float sizeY, float xVelocity) {
        this.xPos = xPos;
        this.yPos = yPos;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.xVelocity = xVelocity;

        this.checkXPos();
        this.checkYPos();
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
        this.yPos += y * this.yVelocity;
        this.checkYPos();
    }

    public float getXPos() {
        return this.xPos;
    }

    public float getYPos() {
        return this.yPos;
    }
    
    public float getSizeX() {
        return this.sizeX;
    }
    
    public float getSizeY(){
        return this.sizeY;
    }
    
    public void checkXPos() {
        float leftBoundrary = sizeX / 2;
        float rightBoundrary = width - leftBoundrary;
        if(this.xPos <= leftBoundrary){
            this.xPos = leftBoundrary;
        } else if (this.xPos >= rightBoundrary) {
            this.xPos = rightBoundrary;
        }
        
    }

    public void checkYPos() {
        float upperBoundrary = sizeY / 2;
        float bottomBoundrary = height - upperBoundrary;
        if(this.yPos <= upperBoundrary){
            this.yPos = upperBoundrary;
        } else if (this.yPos >= bottomBoundrary){
            this.yPos = bottomBoundrary;
        }
    }
}
public class GameLogic {

    SpaceShip spaceShip;
    Obstacle[] obstacles;

    public GameLogic (SpaceShip spaceShip, int obCount) {
        this.spaceShip = spaceShip;
        obstacles = new Obstacle[obCount];
        for (int i = 0; i < obCount; ++i) {
            obstacles[i] = new Obstacle();
        }
    }

    public void compute(int keyCode, boolean keyPressed){
        if(keyPressed){
            spaceShip.moveArrow(keyCode);
        }
        
        for (Obstacle o : this.obstacles) {
            o.move();
        }
    }

    public void draw(){
        spaceShip.draw();
        for (Obstacle o : this.obstacles) {
            o.draw();
        }
    }
    
    private void collide() {
    }
}
public class Obstacle extends Actor {

    public Obstacle(){
        super(random(5, width - 5), random(-height, 5), 10,10);
    }

    public void move(){
        this.moveY(1);
    }

    @Override
    public void checkYPos() {
        float upperBoundrary = sizeY / 2;
        float bottomBoundrary = height - upperBoundrary;
        if (this.yPos >= bottomBoundrary){
            this.yPos = random(-height, 5);
        }
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
  public void settings() {  size(600, 800, OPENGL); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "alienattacke" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
