/*
class that is responsable for creating the car and for its movment
*/

// creating the variables and objects that we need
class Car{
    float speedBackground,speedCar;
    int particles;

    PVector pos;

    ParticleSystem ps;

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
    int hitCoolDown;
        
    // constorctur -- inizializing the variable, we need the position to create this object as a PVector
    Car(PVector positionOriginal, int nOfParticles){
        particles = nOfParticles;
        this.pos = positionOriginal.copy(); // copy so we do not interfear and risk to change the position
        this.speedBackground = 4;
        this. speedCar = 0;
        this.ps = new ParticleSystem();
        this.hitCoolDown = 0;
        LeftPosition = new PVector(pos.x + 10, pos.y + heightCar /2);
        RightPosition = new PVector(pos.x + 40, pos.y + heightCar /2);
        left = new MSDS(1, 20, 0.3, 0.09, LeftPosition);
        right = new MSDS(1, 20, 0.3, 0.09, RightPosition);
    }
    
    // method resposable to move the car -- we pass the bottom road and top road 
    void moveCar(float roadTop, float roadBottom){
        pos.y += speedCar; // update the car position based in the "speed" 

        LeftPosition.y = pos.y + heightCar/2; // update the position of the springs of the car based on the position of the car 
        RightPosition.y = pos.y  + heightCar/2;

        left.update(); // update the MSDS 
        right.update();

        limitCar(roadTop, roadBottom); // we have a method to limit the bacground

        if (hitCoolDown > 0){ // condition to make the car "not collide again with an obstacle -- making it invincible for a while"
            hitCoolDown --;
        }
    }

    void accelerate(float acceleration){ // move the car only vertically while background keeps scrolling

        speedCar += acceleration;

        if (speedCar > 8){
            speedCar = 8;
        }
        if (speedCar < -8){
            speedCar = -8;
        }

        if (acceleration < 0){
            speedBackground += (acceleration*-1); // so the bacgound doesn't go back 
        }
        else{
            speedBackground += acceleration;
        }
    }

    void decelerate(){ // stop only the car movement, background stays moving
        speedCar = 0;
    }

    void limitCar(float roadTop, float roadBottom){ // limit the position of the car 
        if (pos.y < roadTop){
            pos.y = roadTop;
            stopTier();
        }
        else if (pos.y + heightCar > roadBottom){
            pos.y = roadBottom - heightCar;
           stopTier();
        }
    } 

    // method that makes the tier stop
    void stopTier(){ //this was suggested by ChatGPT becuase we coundn't figure out a way to stop the tiers to continue moving
        // stop every component of the MSDS
        left.velocity = 0;
        left.displacement = 0;
        right.velocity = 0;
        right.displacement = 0;
    }

    void displayCar(){ // display the car
        noStroke();
        fill(255, 0, 0);
        rect(pos.x, pos.y, widthCar, heightCar);
        rect(pos.x + 10, pos.y - roofHeight, roofWidth,roofHeight);

        fill(0);
        ellipse(left.position.x, left.position.y, wheelSize, wheelSize);
        ellipse(right.position.x, right.position.y, wheelSize, wheelSize);
       
        showParticles();
        ps.update();
    }

    // method to show thw smoke of the car
    void showParticles(){
        for (int i = 0; i < particles; i++){
            ps.addSmoke(new PVector(pos.x, pos.y + (heightCar/2))); // we are adding the particle based on the position of the car 
        }
        //ps.update(); // update the particle system
    }

   // method to make the suspension of the car oscillate based on a PVector click
    void clickCar(PVector click){
        if (click.x >= pos.x && click.x <= pos.x + widthCar && click.y >= pos.y && click.y <= pos.y + heightCar) { // check if mouse is inside the car --> based on Module 1 
            left.applayForce(5);
            right.applayForce(5);

            isDayTime = !isDayTime; // change the boolean so we can display a different sky
        }
    }

    // method to start the oscillasition of the suspension and other interaction based if the car has collided
    void itCollided(){
        hitCoolDown = 60;
        left.applayForce(6);
        right.applayForce(6);
        speedBackground = max(0, speedBackground - 2);
        speedCar = 0;
        for (int i = 0; i<15; i++ ){ // add sparks -- based on the copy of the position
            ps.addSpark(pos.copy());
        }
    }
}