SpriteManager _SM;

void setup() {
    size(1024, 768);
    _SM = new SpriteManager();
}

void draw() {
    background(0);
    _SM.manage();
}

void keyPressed() {
    _SM.player.keyDown();
}

void keyReleased() {
    _SM.player.keyUp();
}
