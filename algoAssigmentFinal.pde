/*
this is the main class 
we only create the most important objects here
that is the car
*/

Car car;
void setup(){
    fullScreen();
    noSmooth();
    car = new Car(width/2, height/2, 6); // background starts moving immediately
}

void draw(){
    background(255);
    car.moveCar();
    car.displayCar();
}

void keyPressed(){
    if (keyCode == 's' || keyCode == 'S'){
        car.accelerate(2);
    }
    else if (keyCode == 'w' || keyCode == 'W'){
        car.accelerate(-2);
    
    }
}

void keyReleased(){
    car.decelerate();
}

void mousePressed(){
    car.clickCar(mouseX, mouseY);
}