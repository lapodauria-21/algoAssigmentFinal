// general class that contains the car and the some compoents

// yo this is fire
class general{
    int x;
    int posY;
    int speed;

    ParticleSystem ps;
    background backGround;

    MSDS left;
    MSDS right;
    PVector LeftPosition;
    PVector RightPosition;
    
    general(int x, int y, int speed){
        this.x = x;
        this.posY = y;
        this.speed = speed;
        this.ps = new ParticleSystem();
        this.backGround = new background(0, height/2);
        LeftPosition = new PVector(x + 10, posY );
        RightPosition = new PVector(x + 40, posY );
        left = new MSDS(1, 20, 0.3, 0.4, LeftPosition);
        right = new MSDS(1, 20, 0.3, 0.4, RightPosition);
    }
    
    void moveCar(){
        posY += speed;

        LeftPosition.y = posY + 10;
        RightPosition.y = posY + 10;

        left.update();
        right.update();

        backGround.moveRoad(speed);
    }

    void limitCar(){
        if (posY < backGround.y){
            posY = backGround.y;
        }
        else if (posY + 20 > backGround.y + backGround.height){
            posY = backGround.y + backGround.height - 20;
        }
    }

    void displayCar(){
        noStroke();
        fill(255, 0, 0);
        rect(x, posY, 50, 20);
        rect(x + 10, posY - 10, 30, 10);

        fill(0);
        ellipse(left.position.x, left.position.y, 20, 20);
        ellipse(right.position.x, right.position.y, 20, 20);

        showParticles();
    }

    void showParticles(){
        for (int i = 0; i < 5; i++){
            ps.addParticle(new PVector(x, posY + 10));
        }
        ps.update();
    }

    void clickCar(int mouseX, int mouseY){
        if (mouseX >= x && mouseX <= x + 50 && mouseY >= posY && mouseY <= posY + 20) {
            left.applayForce(5);
            right.applayForce(5);
        }
    }
}
