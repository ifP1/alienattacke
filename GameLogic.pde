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
        float leftSpace = spaceShip.getXPos() - spaceShip.getSizeX() / 2;
        float rightSpace = spaceShip.getXPos() + spaceShip.getSizeX() / 2;
        float upSpace = spaceShip.getYPos() - spaceShip.getSizeY() / 2;
        float botSpace = spaceShip.getYPos() + spaceShip.getSizeY() / 2;

        for (Obstacle o : this.obstacles) {
            float leftO = o.getXPos() - o.getSizeX() / 2;
            float rightO = o.getXPos() + o.getSizeX() / 2;
            float upO = o.getYPos() - o.getSizeY() / 2;
            float botO = o.getYPos() + o.getSizeY() / 2;

            boolean insideXBoundrary = (leftSpace >= leftO && leftSpace <= rightO) || (rightSpace >= leftO && rightSpace <= rightO);
            boolean insideYBoundrary = (upSpace >= upO && botSpace <= botO) || (botSpace >= upO && botSpace <= botO);
            
            if(insideXBoundrary && insideYBoundrary){
                return true;
            }
        }

        return false;
    }
}
