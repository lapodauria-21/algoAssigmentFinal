// general class that contains the car and the some compoents

// yo this is fire
class general{
    //float posX;
    //float posY;
    float speed;
    float speedY;

    PVector pos;

    ParticleSystem ps;
    background backGround;

    MSDS left;
    MSDS right;
    PVector LeftPosition;
    PVector RightPosition;
    
    boolean isDayTime = false;
    
    general(float x, float y, float speed){
        this.pos = new PVector(x/2, y);
        this.speed = speed;
        this.speedY = 0;
        this.ps = new ParticleSystem();
        this.backGround = new background(0, height/2, speed);
        LeftPosition = new PVector(x/2 + 10, pos.y );
        RightPosition = new PVector(x/2 + 40, pos.y );
        left = new MSDS(1, 20, 0.3, 0.4, LeftPosition);
        right = new MSDS(1, 20, 0.3, 0.4, RightPosition);
    }
    
    void moveCar(){
        pos.y += speedY;

        //startVelocity();

        LeftPosition.y = pos.y + 10;
        RightPosition.y = pos.y  + 10;

        left.update();
        right.update();

        backGround.displaySky(isDayTime);

        backGround.displayMountains(speed);

        backGround.moveRoad(speed);
        limitCar();
    }
/*
    void startVelocity(){
        if (posY != 0){
            speed = 0.45;
        }
    }
*/
    void limitCar(){
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
        speedY = 0;
        left.velocity = 0;
        left.displacement = 0;
        right.velocity = 0;
        right.displacement = 0;
    }

    void displayCar(){
        noStroke();
        fill(255, 0, 0);
        rect(pos.x, pos.y, 50, 20);
        rect(pos.x + 10, pos.y - 10, 30, 10);

        fill(0);
        ellipse(left.position.x, left.position.y, 20, 20);
        ellipse(right.position.x, right.position.y, 20, 20);


        if (speed != 0){
            showParticles();
        }
    
    }

    void showParticles(){
        for (int i = 0; i < 5; i++){
            ps.addParticle(new PVector(pos.x, pos.y + 10));
        }
        ps.update();
    }

    void clickCar(int mouseX, int mouseY){
        if (mouseX >= pos.x && mouseX <= pos.x + 50 && mouseY >= pos.y && mouseY <= pos.y + 20) {
            left.applayForce(5);
            right.applayForce(5);

            isDayTime = !isDayTime;
        }
    }
}
