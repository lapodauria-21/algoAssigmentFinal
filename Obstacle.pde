/*
This class is based on creating obstacles using three images; however, if that doesn't work, 
orange obstacles are generated instead.
Fixed after hours of troubleshooting thanks to AI
*/

class Obstacle {
    PVector position;
    float w, h;
    float speed;
    boolean active;
    int hitTimer;

    PImage imgOne, imgTwo, imgThree;
    PImage currentImg; 

    Obstacle(float x, float y, float speed) {
        this.position = new PVector(x, y);
        this.speed    = speed;
        this.active   = true;
        this.hitTimer = 0;

        imgOne   = loadImage("WhatsApp Image 2026-06-14 at 4.24.35 PM (1).png");
        imgTwo   = loadImage("WhatsApp Image 2026-06-14 at 4.24.35 PM (2).png");
        imgThree = loadImage("WhatsApp Image 2026-06-14 at 4.24.35 PM.png");

        
        int randomNumber = (int) random(3);
        switch (randomNumber) {
            case 0:  currentImg = imgOne;   break;
            case 1:  currentImg = imgTwo;   break;
            default: currentImg = imgThree; break;
        }

        
        if (currentImg != null) {
            float targetH = 60;
            float ratio   = (float) currentImg.width / currentImg.height; // making bit smaller
            this.h = targetH;
            this.w = targetH * ratio;
        } else {
            this.w = random(25, 50);
            this.h = random(20, 40);
        }
    }

    void update(float currentSpeed) {
        position.x -= (currentSpeed + 2);
        if (position.x + w < 0) {
            active = false;
        }
        if (hitTimer > 0) {
            hitTimer--;
        }
    }

    void display() {
        if (!active) return;

        if (currentImg != null) {
            if (hitTimer > 0) {
                tint(255, 80, 80);
            } else {
                noTint();
            }
            imageMode(CORNER);
            image(currentImg, position.x, position.y, w, h);
            noTint();
        } else {
            noStroke(); // backup
            fill(hitTimer > 0 ? color(255, 0, 0) : color(255, 140, 0));
            rect(position.x, position.y, w, h, 6);
        }
    }

    boolean isHit(PVector posCar, float cw, float ch) {
        return posCar.x < position.x + w && posCar.x + cw > position.x && posCar.y < position.y + h && posCar.y + ch > position.y;
    }

    void triggerTheHit() {
        hitTimer = 30;
    }
}