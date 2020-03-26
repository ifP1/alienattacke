GameLogic gameLogic;
boolean done;
void setup() {

    // Scene Setup
    background(0, 0, 0, 1);
    size(600, 800, OPENGL);

    // Init
    gameLogic = new GameLogic(new SpaceShip(0, height, 50, 50, 10), 30);
    println("Hello World!");
}

void draw() {
    clear();

    if(!done){
    gameLogic.compute(keyCode, keyPressed);
    }
    gameLogic.draw();
        
    if (gameLogic.collide()) {
        println("Done!"); 
        done = true;
    }

}
