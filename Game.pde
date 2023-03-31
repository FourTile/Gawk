// dont initilize here...
Sprite s;


// this runs once at the start, like pre-code
void setup(){
    size(800, 600); // window size, 800 wide, 600 tall
    s = new Sprite(width/2, height/2, 50, 50);
}

// always runs at speed of framerate
void draw(){

    s.update();
    s.display();
}
