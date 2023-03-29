
// this runce once at the statr, like pre-code
void setup(){
    size(800, 600); // window size, 800 wide, 600 tall
}

// always runs at speed of framerate
void draw(){
    // a circle that follows the mouse, 50*50
    ellipse(mouseX, mouseY, 50, 50);
}