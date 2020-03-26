public class Actor {

    float sizeX;
    float sizeY;
    float xPos;
    float yPos;
    float xVelocity;

    public Actor (float xPos, float yPos, float sizeX, float sizeY, float xVelocity) {
        this.xPos = xPos;
        this.yPos = yPos;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.xVelocity = xVelocity;
    }

    public Actor(float xPos, float yPos, float sizeX, float sizeY){
        this(xPos,yPos,sizeX,sizeX,10);
    }

    public void draw(){
        ellipse(xPos, yPos, sizeX, sizeY);
    }

    public void move(float x, float y) {
        this.moveX(x);
        this.moveY(y);
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

    public void moveX(float x){
        this.xPos += x * this.xVelocity;
    }

    public void moveY(float y) {
        this.yPos += y;
    }
}
