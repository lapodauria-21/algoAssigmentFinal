// class to manage the list of particles

class ParticleSystem {

ArrayList<Particle> particles;  

ParticleSystem(){
    particles = new ArrayList<Particle>();
}

    void addSpark(PVector pos){
        particles.add(new Spark(pos));
    }
    void addSmoke (PVector pos){
        particles.add(new Smoke(pos));
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