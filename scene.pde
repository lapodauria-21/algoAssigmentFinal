/*
class that update and display the elements of the mini game --> car, background and the onstacle maanger
*/
class Scene{
    Car car;
    Background bg;
    ObstacleManager obstacles;

    // variable for position of mouse
    PVector mousePos;

    // inzizilize each object
    Scene(int nOfBirds, int nOfStars, int nOfParticles, int nOfClouds){
        car = new Car(new PVector(width/4, height/2), nOfParticles);
        bg = new Background(4, nOfStars, nOfBirds, nOfClouds);
        obstacles = new ObstacleManager();
        mousePos = new PVector(0,0);
    }
    //method to update the scene 
    void updateScene(){
        bg.update(car.speedBackground, mousePos); // change the speed of the bacground -- also passed cordinate of mouse as pred
        obstacles.update(car.speedBackground, bg.roadTop(), bg.roadBottom(), car.heightCar); // Limit the car and update obstacles
        car.moveCar(bg.roadTop(), bg.roadBottom()); // move car and keep it in the limit
        if(obstacles.checkForCollision(car.pos, car.widthCar, car.heightCar)){ // check for collision then update
        car.itCollided();
        }
    }
    // method to display the scene
    void displayScene(){
        bg.display(car.isDayTime); // change of scenne
        obstacles.display();
        car.displayCar();
    }
    // method that checks if there is a metch fot the keypresseds and call function for car
    void handleKeyPressed(int key){
        if (key == 's' || key == 'S'){
            car.accelerate(2);
        }
        else if (key == 'w' || key == 'W' ){
            car.accelerate(-2);
        }
        
    }
    // function that call the car function if there is not a key pressed
    void handleKeyReleased(){
        car.decelerate();
    }
    // method that pass the PVector if there was a click
    void handleClick(PVector click){
        car.clickCar(click);
    }

    // method to handel the position of the mouse
    void handleMouseMuvment(PVector pos){
        mousePos = pos;
    }
}