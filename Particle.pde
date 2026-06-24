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

  // Is the particle still useful? -- using the lifespan to check 
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

/*
this two classes are an extension of the main one, use the same method but differetn constructor --> super spawn
*/

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
    acceleration = new PVector(0, 0.15); // simulate gravity
    velocity = PVector.random2D().mult(random(2,6)); // this create a vector velocity with lenght 1 in random 350 deg pos -- mult
    lifespan = 60;
  }
  @Override // method to overide the original display 
  void display(){
    noStroke();
    fill(255, 150, 0, lifespan * 3.5);
    ellipse(position.x, position.y , 4, 4);
  }
}