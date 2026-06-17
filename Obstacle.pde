/*
This class is based on creating obstacles using three images; however, if that doesn't work, 
orange obstacles are generated instead.
Fixed after hours of troubleshooting thanks to AI
*/

//class that create the obstacle --> update it and inzizialize it based on a random number for the immage 
class Obstacle {
    PVector position;
    float w, h;
    float speed;
    boolean active;
    int hitTimer;

    PImage imgOne, imgTwo, imgThree;
    PImage currentImg; 

    // constuctor to inzizialize the variables and load the pictures
    Obstacle(float x, float y, float speed) {
        this.position = new PVector(x, y);
        this.speed    = speed;
        this.active   = true;
        this.hitTimer = 0;

        imgOne   = loadImage("WhatsApp Image 2026-06-14 at 4.24.35 PM (1).png");
        imgTwo   = loadImage("WhatsApp Image 2026-06-14 at 4.24.35 PM (2).png");
        imgThree = loadImage("WhatsApp Image 2026-06-14 at 4.24.35 PM.png");

        
        int randomNumber = (int) random(3);
        switch (randomNumber) { // case to see assign the random immage to the current immage 
            case 0:  currentImg = imgOne;   break;
            case 1:  currentImg = imgTwo;   break;
            default: currentImg = imgThree; break;
        }

        
        if (currentImg != null) { // case where immage is not null
            float targetH = 60;
            float ratio   = (float) currentImg.width / currentImg.height; // making bit smaller --> still keeping the proportion
            this.h = targetH;
            this.w = targetH * ratio;
        } else { // in case assaign a random width and height
            this.w = random(25, 50);
            this.h = random(20, 40);
        }
    }

    // method to update the obstacle based on the current speed
    void update(float currentSpeed) {
        position.x -= (currentSpeed + 2);
        if (position.x + w < 0) {
            active = false; // check id obstacle is asctive
        }
        if (hitTimer > 0) { // check if the obstacle was collided
            hitTimer--;
        }
    }

    // method to display
    void display() {
        if (!active) return;

        if (currentImg != null) {
            if (hitTimer > 0) { // case in withch the onstacle was hit
                tint(255, 80, 80);
            } else {
                noTint(); // color of the immage
            }
            imageMode(CORNER);
            image(currentImg, position.x, position.y, w, h);
            noTint();
        } else {
            noStroke(); // backup --> display a rectangle 
            fill(hitTimer > 0 ? color(255, 0, 0) : color(255, 140, 0));
            rect(position.x, position.y, w, h, 6);
        }
    }

    // method to check if there was a collision -- > based on position and the car width and height
    boolean isHit(PVector posCar, float cw, float ch) {
        return posCar.x < position.x + w && posCar.x + cw > position.x && posCar.y < position.y + h && posCar.y + ch > position.y;
    }

    //Start the timer for the hit
    void triggerTheHit() {
        hitTimer = 30;
    }
}