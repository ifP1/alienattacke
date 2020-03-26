public class GameLogic {

    SpaceShip spaceShip;
    Obstacle[] obstacles;
    boolean lost = false;

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
