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
    
    public boolean collide() {
        float xspaceShip = spaceShip.getXPos();
        float yspaceShip = spaceShip.getYPos();

        for (Obstacle o : this.obstacles) {
            boolean insideXBoundrary = xspaceShip >= o.getXPos() - o.getSizeX() / 2 && xspaceShip <= o.getXPos() + o.getSizeX() / 2;
            boolean insideYBoundrary = yspaceShip >= o.getYPos() - o.getSizeY() / 2 && yspaceShip <= o.getYPos() + o.getSizeY() / 2;
            if(insideXBoundrary && insideYBoundrary){
                return true;
            }
        }

        return false;
    }
}
