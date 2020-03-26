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
        this.yPos += y;
        this.checkYPos();
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
