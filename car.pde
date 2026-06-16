// general class that contains the car and the some compoents
// meaning that we call other objects that the car interact with

// yo this is fire
class Car{
    float speedBackground,speedCar;

    PVector pos;

    ParticleSystem ps;
    //background backGround;

    MSDS left; // MSDS was given thanks to an assigment
    MSDS right;
    
    PVector LeftPosition;
    PVector RightPosition;
    
    // variables for describing car
  // variables for describing car
    float widthCar = 50;
    float heightCar = 20;
    float roofHeight = 10;
    float wheelSize = 20;
    float roofWidth = 30;
    
    boolean isDayTime = false;

    // collision variables
    //ArrayList<Obstacle> obstacles;
    //int spawnTimer, Intervall, hitCoolDown;

    int hitCoolDown;
        
    Car(PVector positionOriginal){
        this.pos = positionOriginal.copy();
        this.speedBackground = 4;
        this. speedCar = 0;



        
        //this.pos = new PVector(x/2, y);
        //this.speedBackground = speed;
        //this.speedCar = 0;
        this.ps = new ParticleSystem();
        //this.backGround = new background(0, height/2, speed);
        //this.obstacles = new ArrayList<Obstacle>();
        //this.spawnTimer = 0;
        this.hitCoolDown = 0;
        LeftPosition = new PVector(pos.x + 10, pos.y + heightCar /2);
        RightPosition = new PVector(pos.x + 40, pos.y + heightCar /2);
        left = new MSDS(1, 20, 0.3, 0.4, LeftPosition);
        right = new MSDS(1, 20, 0.3, 0.4, RightPosition);
    }
    
    void moveCar(float roadTop, float roadBottom){
        pos.y += speedCar; // update the car based in the position 

        //startVelocity();

        LeftPosition.y = pos.y + heightCar/2; // update the position of the springs of the car based on the position of the car 
        RightPosition.y = pos.y  + heightCar/2;

        left.update();
        right.update();

        //updateBackground();
        limitCar(roadTop, roadBottom);

        //if (speedBackground > 0){
        //    spawnTheObstacle();
        //    updateObstacles();
        //}
        if (hitCoolDown > 0){
            hitCoolDown --;
        }
    }
/*
    void updateBackground(){ 
        backGround.displaySky(isDayTime);
        backGround.displayMountains(speedBackground);
        backGround.moveRoad(speedBackground);
        backGround.displayBoide();
    }
        */

    void accelerate(float acceleration){ // move the car only vertically while background keeps scrolling
        /*
        speedCar += acceleration;
        //speedBackground = acceleration ;
        if (acceleration < 0){
            speedBackground += (acceleration*-1);
        }
        else{
            speedBackground += acceleration;
        }
        //speedBackground += acceleration;
        */
        speedCar += acceleration;
        speedBackground += acceleration;

    if (speedCar > 8){
        speedCar = 8;
    }
    if (speedCar < -8){
        speedCar = -8;
    }

    if (acceleration < 0){
        speedBackground += (acceleration*-1);
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

    void stopTier(){ //this was suggested by ChatGPT becuase we coundn't figure out a way to stop the tiers to continue moving
        speedCar = 0; // stop the speed of the car --> then stop every component of the MSDS
        left.velocity = 0;
        left.displacement = 0;
        right.velocity = 0;
        right.displacement = 0;
        showParticles();
    }

    void displayCar(){ // display the car and only if there is a movment then start the particles
        noStroke();
        fill(255, 0, 0);
        rect(pos.x, pos.y, widthCar, heightCar);
        rect(pos.x + 10, pos.y - roofHeight, roofWidth,roofHeight);

        fill(0);
        ellipse(left.position.x, left.position.y, wheelSize, wheelSize);
       ellipse(right.position.x, right.position.y, wheelSize, wheelSize);
       
        showParticles();

        //for (Obstacle obs : obstacles){
        //    obs.display();
        //}
    
    }

    void showParticles(){
        for (int i = 0; i < 5; i++){
            ps.addParticle(new PVector(pos.x, pos.y + (heightCar/2))); // we are adding the particle based on the position of the car 
        }
        ps.update(); // update the particle system
    }

    void clickCar(PVector click){
        if (click.x >= pos.x && click.x <= pos.x + widthCar && click.y >= pos.y && click.y <= pos.y + heightCar) { // check if mouse is inside the car --> based on Module 1 
            left.applayForce(5);
            right.applayForce(5);

            isDayTime = !isDayTime; // change the boolean so we can display a different sky
        }
    }
    /*
    void spawnTheObstacle(){
        spawnTimer++;
         Intervall = max(40, 120 - (int) speedBackground * 5);

        if (spawnTimer >= Intervall) {
            spawnTimer = 0;
            // Y casuale all'interno della metà inferiore (la strada)
            float roadTop = backGround.position.y;
            float roadBottom = roadTop + height / 2 - heightCar - 10;
            float obsY = random(roadTop + 5, roadBottom);
            obstacles.add(new Obstacle(width + 20, obsY, speedBackground));
        }
    }

    void updateObstacles(){
        for (int i = obstacles.size() -1; i >= 0; i--){
            Obstacle obs = obstacles.get(i);
            obs.update(speedBackground);

            if(hitCoolDown == 0 && obs.isHit(pos.x, pos.y, widthCar, heightCar)){
                obs.triggerTheHit();
                itCollided();
            }

            if(!obs.active){
                obstacles.remove(i);
            }
        }
    }
        */

    void itCollided(){
        hitCoolDown = 60;
        left.applayForce(8);
        right.applayForce(8);
        speedBackground = max(0, speedBackground - 2);
        speedCar = 0;
    }
}