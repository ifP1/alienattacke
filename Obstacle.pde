public class Obstacle extends Actor {

    public Obstacle(){
        super(random(5, width - 5), random(-height, 5), 10,10,1);
    }

    public void move(){
        this.moveY(1);
        this.moveX(random(-5,5));
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
