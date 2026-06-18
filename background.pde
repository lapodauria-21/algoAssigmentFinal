// clas for backfeound
// we are adding the mountains, the stars and the cloud and also the road
//We also load an image that is assigned to the boid to represent the birds.

class Background{
    // creating the objects that are part of the background and their parasmeters
    PVector position;

    ArrayList<Mountain> mountains;

    ArrayList<Cloud> clouds;

    Stars[] stars;

    ArrayList<Boid> boidOne;
    
    PImage img;

    float speed;
    int nStars, nBirds;

    // consttoctor of the class -- to inizialize the objects & parameters
    Background(float speed, int nOfStars, int nOfBirds){ // we need the speed of the background for this parameters
        this.position = new PVector(0, height/2);
        this.speed = speed;

        this.nStars = nOfStars;
        this.nBirds = nOfBirds;

        this.mountains = new ArrayList<Mountain>(); // inizialinzing the array list
        // Create mountains with different colors
        mountains.add(new Mountain(100, 0.01, 80, position.y - 50, color(50, 100, 50))); // we call two mountains with intial speed of 0 so they do not start mooving
        mountains.add(new Mountain(0, 0.008, 60, position.y - 30, color(80, 130, 80))); 

        boidOne = new ArrayList<Boid>();
        img = loadImage("swallows-bird-martins-bird-saw-wings-bird-isolated-swallows-bird-flying-with-wings-spread-png.png");

        for (int i = 0; i < nBirds; i++) { // we are creating the array for the birds 
            boidOne.add(new Boid(random(0, width), random(0, height/2), img));
        }

        this.clouds = new ArrayList<Cloud>(); // same thing for thew clouds
        for (int i = 0; i < 5; i++) {
        clouds.add(new Cloud()); 
        }

        this.stars = new Stars[nStars]; // fixed number for the ammount of stars -- difference with arraylist
        for (int i = 0; i < stars.length; i++) {
            stars[i] = new Stars();
        }

    }

    // method to display the road
    void displayRoad(){
        fill(50);
        rect(position.x, position.y, width+300, height/2); // create the basic sturcture of the road

        fill(0); 
        for (int i = 0; i < width; i += 40){ // with this create the different lanes
            rect(position.x + i, position.y + height/4 - 5, 20, 10);
        }
    }

    // method to update the road to simulate the movments
    void moveRoad(){
        position.x -= speed/100; // simulate the movment based on the speed
        if (position.x <= -40){ 
            position.x = 0;
        }
    }

    // method to display the mountains
    void displayMountains(){
        for (Mountain m : mountains) { // for every element inside the array  -- advance for loop
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
    //method to update the boids
    void updateBoide(PVector pre){
        for (Boid b : boidOne){
            b.run(boidOne, pre);
        }
    }

    // display the boide so the birds -- andavce for loop
    void displayBoide(){
        for (Boid b : boidOne) {
            b.render();
        }
    }

    // method to update the mountain and the road based on the current speed
    void update(float currentSpeed, PVector predator){
        this.speed = currentSpeed; // assaign to speed of this class the currentSpeed
        moveRoad();
        for (Mountain m : mountains){
            m.scrollSpeed = currentSpeed / 500; // so it doesn't zoom to fast
            m.update();
        }
        updateBoide(predator);
    }

    // method to display the bacground -- calling other methods
    void display(boolean isNight){
        displaySky(isNight);
        displayMountains();
        displayRoad();
        displayBoide();
    }

    // method to change the speed -- every time take the maxium between the two values
    void accelerate(float ammount){
        speed = max(0, speed + (ammount*-1));
    }

    // method that return the float for the top road
    float roadTop(){
        return position.y;
    }
    // method that gives the float for the bottom road
    float roadBottom(){
        return position.y + height/2;
    }
}