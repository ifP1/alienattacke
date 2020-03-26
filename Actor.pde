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
