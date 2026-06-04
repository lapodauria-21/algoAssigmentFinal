// class to manage the list of particles

class ParticleSystem {

ArrayList<Particle> particles;  

ParticleSystem(){
    particles = new ArrayList<Particle>();
}
void addParticle(PVector location){
    particles.add(new Particle(location));
}
void update(){
    for (int i = particles.size() - 1; i >= 0; i--){
        Particle p = particles.get(i);
        p.run();
        if (p.isDead()){
            particles.remove(i);
        }
    }
  }
}