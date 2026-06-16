/*
this is the main class 
we only create the most important objects here
that is the car
*/

Car car;
background br;
ObstacleManager obstacle;

void setup(){
    fullScreen();
    noSmooth();
    car = new Car(new PVector(width/4, height/2)); // background starts moving immediately
    br = new background (4);
    obstacle = new ObstacleManager();

}

void draw(){
    background(255);
    br.update(car.speedBackground);
    br.display(car.isDayTime);
   obstacle.update(car.speedBackground, br.roadTop(), br.roadBottom(), car.heightCar);
    obstacle.display();


    car.moveCar(br.roadTop(), br.roadBottom());
    car.displayCar();

    if(obstacle.checkForCollision(car.pos, car.widthCar, car.heightCar)){
        car.itCollided();
    }
}

void keyPressed(){
    if (keyCode == 's' || keyCode == 'S'){
        car.accelerate(2);
        //br.accelerate(2);
    }
    else if (keyCode == 'w' || keyCode == 'W'){
        car.accelerate(-2);
        //br.accelerate(-2);
    
    }
}

void keyReleased(){
    car.decelerate();
}

void mousePressed(){
    PVector click = new PVector(mouseX, mouseY);
    car.clickCar(click);
}