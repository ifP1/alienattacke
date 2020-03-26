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
