/*
this is the main class 
we only create the most important objects here
that is the car
*/

Car car;
void setup(){
    fullScreen();
    car = new Car(width/2, height/2, 0);
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