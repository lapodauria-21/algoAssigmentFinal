/*
class that update and display the elements of the mini game --> car, background and the onstacle maanger
*/
class Scene{
    Car car;
    Background bg;
    ObstacleManager obstacles;

    // inzizilize each object
    Scene(){
        car = new Car(new PVector(width/4, height/2));
        bg = new Background(4);
        obstacles = new ObstacleManager();
    }
    //method to update the scene 
    void updateScene(){
        bg.update(car.speedBackground); // change the speed of the bacground
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
        else if (key == 'W' || key == 'w' ){
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
}