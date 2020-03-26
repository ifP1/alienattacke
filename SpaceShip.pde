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
