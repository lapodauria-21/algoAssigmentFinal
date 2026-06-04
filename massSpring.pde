// Mass Spring Damper Syetemn 

class MSDS {
  float segmentLength;
  float mass;
  float force;
  float damping;
  float springConstant;
  PVector position;
  PVector anchor;
  float restLength;
  float velocity;
  float displacement;
  float connectedForce;

  MSDS(float mass, float segmentLength, float springConstant, float damping, PVector position) {
    this.segmentLength = segmentLength;
    this.mass = mass;
    this.damping = damping;
    this.springConstant = springConstant;
    this.anchor = position.copy(); // so we have aqn ancor to the original position
    this.restLength = segmentLength;
    this.position = new PVector(position.x, position.y + restLength); // initial position is below the anchor
    this.force = 0;
    this.velocity = 0;
    this.displacement = 0;
    this.connectedForce = 0;
  }

  void update() {
    float springForce = -springConstant * displacement;
    float dampForce = -damping * velocity;
    force = springForce + dampForce + connectedForce;
    float acceleration = force / mass;
    velocity += acceleration;
    displacement += velocity;
    position.x = anchor.x;
    position.y = anchor.y + restLength + displacement;
    connectedForce = 0;
  }

  void applayForce(float impulse) {
    velocity += impulse;
  }
}
