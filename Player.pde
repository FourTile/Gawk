class Player extends Sprite {
    boolean left, right, up, down, space;
    int health = 3;
    
    Player(float x, float y) {
        // super refers to the parent
        // ... I use it here as a constructor
        super(x, y, 40, 40); // in this case, Sprite
        team = 1;
    }

    @Override
    void display(){
        fill(70,0,70);
        ellipse(pos.x, pos.y, size.x, size.y);
        textSize(44);
        fill(255,255,255);
        text("lives: " + health, 850, 50); 
    }

    @Override
    void handleCollision(){
        health --;
        if(health == 0){
            _SM.destroy(this);
        }
    }

    @Override
    void update() {
        float speed = 1.2;
        if (left)  vel.add(new PVector( -speed, 0));
        if (right) vel.add(new PVector(speed, 0));
        if (up)    vel.add(new PVector(0, -speed));
        if (down)  vel.add(new PVector(0, speed));
        // update the position by velocity
        pos.add(vel);
        // always try to decelerate
        vel.mult(0.95);

        if (pos.x < 0 + size.x/2){
            pos.x = size.x/2;
            vel.x = 0;
        }
        if(pos.x > width - size.x/2){
            pos.x = width - size.x/2;
            vel.x = 0;
        }
        if(pos.y < 0 + size.y/2) {
            pos.y = size.y/2;
            vel.y = 0;
        }
        if(pos.y > height - size.y/2){
            pos.y = height-size.y/2;
            vel.y = 0;
        }
    }
    void keyUp() {
        switch(key) { // key is a global value
            case 'a':
            case 'A' : left = false; break;
            case 's':
            case 'S' : down = false; break;
            case 'd':
            case 'D' : right = false; break;
            case 'w':
            case 'W' : up = false; break;
        }
    }
    void keyDown() {
        switch(key) { // key is a global value
            case 'a':
            case 'A' : left = true; break;
            case 's':
            case 'S' : down = true; break;
            case 'd':
            case 'D' : right = true; break;
            case 'w':
            case 'W' : up = true; break;
            case ' ' : fire(); break;
        }
    }
    void fire() {
        _SM.spawn(new Bullet(pos.x, pos.y, new PVector(0 + vel.x, -10 + vel.y), team));
    }
}