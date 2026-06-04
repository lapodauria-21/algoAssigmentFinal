// A class to describe a single particle

class Particle{
     PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(-0.02, -0.02);
    velocity = new PVector(random(-3, -1), random(-1, 1));
    position = l.copy();
    lifespan = 105.0;
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