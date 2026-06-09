general g;
void setup(){
    fullScreen();
    g = new general(width/2, height/2, 0);
}

void draw(){
    background(255);
    g.moveCar();
    g.displayCar();
}

void keyPressed(){
    if (keyCode == 'a' || keyCode == 'A'){
        g.speed += 0.45;
    }
    else if (keyCode == 'd' || keyCode == 'D'){
        g.speed -= 0.45;
    
    }
}

void keyReleased(){
    g.speed = 0;
}

void mousePressed(){
    g.clickCar(mouseX, mouseY);
}