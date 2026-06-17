// A class to describe a single particle --> based on an assigment
class Particle{
     PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector spawn) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0,0);
    position = spawn.copy();
    lifespan = 100.0;
  }

  void run() {
    display();
    update();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(position.x, position.y, 12, 12);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class Smoke extends Particle{
  Smoke(PVector spawn){
    super (spawn);
    acceleration = new PVector(-0.02, -0.02);
    velocity = new PVector(random (-3, -1), random (-1, 1));
    lifespan = 105;
  }
}

class Spark extends Particle{
  Spark(PVector spawn){
    super (spawn);
    acceleration = new PVector(0, 0.15);
    velocity = PVector.random2D().mult(random(2,6));
    lifespan = 60;
  }
  @Override
  void display(){
    noStroke();
    fill(255, 150, 0, lifespan * 3.5);
    ellipse(position.x, position.y , 4, 4);
  }
}