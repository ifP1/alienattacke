Actor actor;

void setup() {

    // Scene Setup
    background(0, 0, 0, 1);
    size(200, 200, OPENGL);

    // Init
    actor  = new Actor(0, height, 100, 100);
    println("Hello World!");
}

void draw() {
    clear();
    if(keyPressed){
        actor.moveHoriArrow(keyCode);
    }
    actor.draw();
}
