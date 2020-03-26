GameLogic gameLogic;

void setup() {

    // Scene Setup
    background(0, 0, 0, 1);
    size(600, 800, OPENGL);

    // Init
    gameLogic = new GameLogic(new SpaceShip(0, height, 50, 50, 10), 50);
    println("Hello World!");
}

void draw() {
    clear();
    gameLogic.compute(keyCode, keyPressed);
    gameLogic.draw();
}
