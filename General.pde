// general class that contains the car and the some compoents

// yo this is fire
class general{
    int x;
    int y;
    int speed;

    ParticleSystem ps;

    MSDS left;
    MSDS right;
    PVector LeftPosition;
    PVector RightPosition;
    
    general(int x, int y, int speed){
        this.x = x;
        this.y = y;
        this.speed = speed;
        this.ps = new ParticleSystem();

        LeftPosition = new PVector(x + 10, y );
        RightPosition = new PVector(x + 40, y );
        left = new MSDS(1, 20, 0.3, 0.4, LeftPosition);
        right = new MSDS(1, 20, 0.3, 0.4, RightPosition);
    }
    
    void moveCar(){
        x += speed;

        LeftPosition.x = x + 10;
        RightPosition.x = x + 40;

        left.update();
        right.update();
    }

    void displayCar(){
        noStroke();
        fill(255, 0, 0);
        rect(x, y, 50, 20);
        rect(x + 10, y - 10, 30, 10);

        fill(0);
        ellipse(left.position.x, left.position.y, 20, 20);
        ellipse(right.position.x, right.position.y, 20, 20);

        showParticles();
    }

    void showParticles(){
        for (int i = 0; i < 5; i++){
            ps.addParticle(new PVector(x, y + 10));
        }
        ps.update();
    }

    void clickCar(int mouseX, int mouseY){
        if (mouseX >= x && mouseX <= x + 50 && mouseY >= y && mouseY <= y + 20) {
            left.applayForce(5);
            right.applayForce(5);
        }
    }
}
