GameLogic gameLogic;

void setup() {

    // Scene Setup
    background(0, 0, 0, 1);
    size(200, 200, OPENGL);

    // Init
    gameLogic = new GameLogic(new Actor(0, height, 50, 50));
    println("Hello World!");
}

void draw() {
    clear();
    if(keyPressed){
        gameLogic.compute(keyCode);
    }

    gameLogic.draw();
}
