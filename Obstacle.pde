class Obstacle{
    PVector position;
  float w, h; 
  float speed; 
  boolean active; 
  color baseColor;
  color currentColor;
  int hitTimer, randomNumber;

  //loader of immages 
  PImage imgOne,imgTwo, imgThree;



  Obstacle(float x, float y, float speed){
    this.position = new PVector(x, y);
    this.w = random(25, 50);
    this.h = random(20, 40);
    this.speed = speed;
    this.active = true;
    this.baseColor = color(255, 140, 0);
    this.currentColor = baseColor;
    this.hitTimer   = 0;
  }

  void update(float currentSpeed){
    position.x -= (currentSpeed +2);
    if (position.x + w < 0){
        active = false;
    } 

    if (hitTimer > 0){
        hitTimer --;
        currentColor = color (255, 0 ,0);
    }
    else {
        currentColor = baseColor;
    }
  }

  void display(){
    if (!active){
        return;
    }
    noStroke();
    fill(currentColor);
    rect(position.x, position.y, w, h, 6);

    fill(50, 80, 120, 200);
    rect(position.x + w * 0.6, position.y + h * 0.1, w * 0.3, h * 0.5, 3);
  }
  boolean isHit(float cx, float cy, float cw, float ch){
      return cx < position.x + w  && cx + cw > position.x && cy < position.y + h  && cy + ch > position.y;
  }

  void triggerTheHit(){
    hitTimer = 30;
  }

  void randomObsacle(){
    randomNumber = (int) random(0, 2);
    switch (randomNumber){
        case 0:
       imgOne = loadImage("WhatsApp Image 2026-06-14 at 4.24.35 PM (1).png");
       case 1:
       imgTwo = loadImage("WhatsApp Image 2026-06-14 at 4.24.35 PM (2).png");
       case 2:
   imgThree = loadImage("WhatsApp Image 2026-06-14 at 4.24.35 PM.png"); 
    }

  }
}