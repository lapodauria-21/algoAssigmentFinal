// clas for backfeound
class background{
    //float x, y;
    PVector position;

    ArrayList<Mountain> mountains;

    ArrayList<Cloud> clouds;

    float speed;
    background(float x, float y, float speed){
        this.position = new PVector(x, y);
        this.speed = speed  ;

        this.speed = speed;

        this.mountains = new ArrayList<Mountain>();
        // Create mountains with different colors
        mountains.add(new Mountain(0, 0.01, 80, y - 50, color(50, 100, 50)));
        mountains.add(new Mountain(0, 0.008, 60, y - 30, color(80, 130, 80)));
        //this.speed = speed;

        this.clouds = new ArrayList<Cloud>();
        for (int i = 0; i < 5; i++) {
        clouds.add(new Cloud());
        }

    }

    void displayRoad(){
        fill(50);
        rect(position.x, position.y, width+300, height/2);

        fill(0);
        for (int i = 0; i < width; i += 40){
            rect(position.x + i, position.y + height/4 - 5, 20, 10);
        }
    }

    void moveRoad(float speed){
        displayRoad();
        position.x -= speed;
        if (position.x <= -40){
            position.x = 0;
        }
    }

    void displayMountains(float currentSpeed){
        for (Mountain m : mountains) {
           
            m.scrollSpeed = currentSpeed / 500.0;
            m.update();
            m.display();
        }
    }

    void displaySky(boolean toggle){
        if (!toggle) {
            fill(135, 206, 235); 
            rect(0, 0, width, height/2);
            for (Cloud c : clouds) {
                c.displayClouds();
            }
        } else {
            fill(0); 
            rect(0, 0, width, height/2);
        }
    }

}