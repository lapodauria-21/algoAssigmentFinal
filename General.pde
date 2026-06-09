// general class that contains the car and the some compoents

// yo this is fire
class general{
    float posX;
    float posY;
    float speed;

    ParticleSystem ps;
    background backGround;

    MSDS left;
    MSDS right;
    PVector LeftPosition;
    PVector RightPosition;
    
    general(float x, float y, float speed){
        this.posX = x/2;
        this.posY = y;
        this.speed = speed;
        this.ps = new ParticleSystem();
        this.backGround = new background(0, height/2, speed);
        LeftPosition = new PVector(x/2 + 10, posY );
        RightPosition = new PVector(x/2 + 40, posY );
        left = new MSDS(1, 20, 0.3, 0.4, LeftPosition);
        right = new MSDS(1, 20, 0.3, 0.4, RightPosition);
    }
    
    void moveCar(){
        posY += speed;

        limitSpeed();

        LeftPosition.y = posY + 10;
        RightPosition.y = posY + 10;

        left.update();
        right.update();

        backGround.displayMountains(speed);

        backGround.moveRoad(speed);
        limitCar();
    }

    void limitCar(){
        if (posY < backGround.y){
            posY = backGround.y;
        }
        else if (posY + 20 > backGround.y + height/2){
            posY = backGround.y + height/2 - 20;
        }
    }

    void limitSpeed(){
        if (speed <= 0){
            speed = 0;
        }
    }

    void displayCar(){
        noStroke();
        fill(255, 0, 0);
        rect(posX, posY, 50, 20);
        rect(posX + 10, posY - 10, 30, 10);

        fill(0);
        ellipse(left.position.x, left.position.y, 20, 20);
        ellipse(right.position.x, right.position.y, 20, 20);


        if (speed != 0){
            showParticles();
        }
    
    }

    void showParticles(){
        for (int i = 0; i < 5; i++){
            ps.addParticle(new PVector(posX, posY + 10));
        }
        ps.update();
    }

    void clickCar(int mouseX, int mouseY){
        if (mouseX >= posX && mouseX <= posX + 50 && mouseY >= posY && mouseY <= posY + 20) {
            left.applayForce(5);
            right.applayForce(5);
        }
    }
}
