// general class that contains the car and the some compoents
// meaning that we call other objects that the car interact with

// yo this is fire
class Car{
    float speedBackground,speedCar;

    PVector pos;

    ParticleSystem ps;
    background backGround;

    MSDS left; // MSDS was given thanks to an assigment
    MSDS right;
    
    PVector LeftPosition;
    PVector RightPosition;
    
    // variables for describing car
    float widthCar = 50;
    float heightCar = 20;
    float roofHeight = 10;
    float wheelSize = 20;
    float roofWidth = 30;
    
    boolean isDayTime = false;
        
    Car(float x, float y, float speed){
        this.pos = new PVector(x/2, y);
        this.speedBackground = speed;
        this.speedCar = 0;
        this.ps = new ParticleSystem();
        this.backGround = new background(0, height/2, speed);
        LeftPosition = new PVector(x/2 + 10, pos.y );
        RightPosition = new PVector(x/2 + 40, pos.y );
        left = new MSDS(1, 20, 0.3, 0.4, LeftPosition);
        right = new MSDS(1, 20, 0.3, 0.4, RightPosition);
    }
    
    void moveCar(){
        pos.y += speedCar; // update the car based in the position 

        //startVelocity();

        LeftPosition.y = pos.y + heightCar/2; // update the position of the springs of the car based on the position of the car 
        RightPosition.y = pos.y  + heightCar/2;

        left.update();
        right.update();

        updateBackground();
        limitCar();
    }

    void updateBackground(){ 
        backGround.displaySky(isDayTime);
        backGround.displayMountains(speedBackground);
        backGround.moveRoad(speedBackground);
    }

    void accelerate(float acceleration){ // method to change the bacgroundn based on the acceleration of the car
        if(acceleration < 0){
            speedBackground += (acceleration * -1);
        }
        else{
            speedBackground += acceleration;
        }
        speedCar += acceleration;
    }

    void decelerate(){ // stop the movment
     speedBackground = 0;
     speedCar = 0;
    }

    void limitCar(){ // limit the position of the car 
        if (pos.y < backGround.position.y){
            pos.y = backGround.position.y;
            stopTier();
        }
        else if (pos.y + 20 > backGround.position.y + height/2){
            pos.y = backGround.position.y + height/2 - 20;
           stopTier();
        }
    } 

    void stopTier(){ //this was suggested by ChatGPT becuase we coundn't figure out a way to stop the tiers to continue moving
        speedCar = 0; // stop the speed of the car --> then stop every component of the MSDS
        left.velocity = 0;
        left.displacement = 0;
        right.velocity = 0;
        right.displacement = 0;
    }

    void displayCar(){ // display the car and only if there is a movment then start the particles
        noStroke();
        fill(255, 0, 0);
        rect(pos.x, pos.y, widthCar, heightCar);
        rect(pos.x + 10, pos.y - roofHeight, roofWidth,roofHeight);

        fill(0);
        ellipse(left.position.x, left.position.y, wheelSize, wheelSize);
        ellipse(right.position.x, right.position.y, wheelSize, wheelSize);


        if (speedCar != 0){
            showParticles();
        }
    
    }

    void showParticles(){
        for (int i = 0; i < 5; i++){
            ps.addParticle(new PVector(pos.x, pos.y + (heightCar/2))); // we are adding the particle based on the position of the car 
        }
        ps.update(); // update the particle system
    }

    void clickCar(int mouseX, int mouseY){
        if (mouseX >= pos.x && mouseX <= pos.x + widthCar && mouseY >= pos.y && mouseY <= pos.y + heightCar) { // check if mouse is inside the car --> based on Module 1 
            left.applayForce(5);
            right.applayForce(5);

            isDayTime = !isDayTime; // change the boolean so we can display a different sky
        }
    }
}
