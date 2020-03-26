public class GameLogic {

    Actor actor;

    public GameLogic (Actor actor) {
        this.actor = actor;
    }

    public void compute(int keyCode){
        actor.moveArrow(keyCode);
    }

    public void draw(){
        actor.draw();
    }
    
    private void collide() {
    }
}
