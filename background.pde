// clas for backfeound
// we are adding the mountains, the stars and the cloud and also the road
//We also load an image that is assigned to the boid to represent the birds.
class background{
    //float x, y;
    PVector position;

    ArrayList<Mountain> mountains;

    ArrayList<Cloud> clouds;

    stars[] stars;

ArrayList<Boid> boidOne;
ArrayList<Boid> boidTwo;
PImage img;

    float speed;
    background(float speed){
        this.position = new PVector(0, height/2);
        this.speed = speed;

        //this.speed = speed;

        this.mountains = new ArrayList<Mountain>(); // inizialinzing the array list
        // Create mountains with different colors
        mountains.add(new Mountain(100, 0.01, 80, position.y - 50, color(50, 100, 50))); // we call two mountains with intial speed of 0 so they do not start mooving
        mountains.add(new Mountain(0, 0.008, 60, position.y - 30, color(80, 130, 80)));
        //this.speed = speed;

        boidOne = new ArrayList<Boid>();
        boidTwo = new ArrayList<Boid>();
        img = loadImage("swallows-bird-martins-bird-saw-wings-bird-isolated-swallows-bird-flying-with-wings-spread-png.png");

  for (int i = 0; i < 20; i++) {
    boidOne.add(new Boid(random(0, width), random(0, height/2), img));
    boidTwo.add(new Boid(random(0, width), random(0, height/2), img));
}

        this.clouds = new ArrayList<Cloud>(); // same thing for thew clouds but we used a foor loop
        for (int i = 0; i < 5; i++) {
        clouds.add(new Cloud()); 
        }

        this.stars = new stars[1000]; // fixed number for the ammount of stars
        for (int i = 0; i < stars.length; i++) {
            stars[i] = new stars();
        }

    }

    void displayRoad(){
        fill(50);
        rect(position.x, position.y, width+300, height/2); // create the basic sturcture of the road

        fill(0); 
        for (int i = 0; i < width; i += 40){ // with this create the different lanes
            rect(position.x + i, position.y + height/4 - 5, 20, 10);
        }
    }

    void moveRoad(){
        //displayRoad(); // we call the display method
        position.x -= speed/100; // simulate the movment based on the speed
        if (position.x <= -40){ 
            position.x = 0;
        }
    }

    void displayMountains(){
        for (Mountain m : mountains) { // for every element inside the array 
           
            //m.scrollSpeed = currentSpeed / 500.0; // speed of the scroll based on the current speed 
            //m.update();
            m.display();
        }
    }

    void displaySky(boolean toggle){ // this is a method with a toogle based on the mouse click --> then we display every thing iside both arrays
        if (!toggle) {
            fill(135, 206, 235); 
            rect(0, 0, width, height/2);
            for (Cloud c : clouds) {
                c.displayClouds();
            }
        } else {
            fill(0); 
            rect(0, 0, width, height/2);
            for(int i = 0; i < stars.length; i++){
                stars[i].displayStars();
            }
        }
    }

void displayBoide(){
        for (Boid b : boidOne) {
            b.run(boidOne);
        }
        for (Boid a: boidTwo){
            a.run(boidTwo);
        }
}

void update(float currentSpeed){
    this.speed = currentSpeed;
    moveRoad();
    for (Mountain m : mountains){
        m.scrollSpeed = currentSpeed / 500;
        m.update();
    }
}

void display(boolean isNight){
    displaySky(isNight);
    displayMountains();
    displayRoad();
    displayBoide();
}

void accelerate(float ammount){
    speed = max(0, speed + (ammount*-1));
}

float roadTop(){
    return position.y;
}
float roadBottom(){
    return position.y + height/2;
}

}