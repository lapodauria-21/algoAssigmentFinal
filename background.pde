// clas for backfeound
class background{
    float x, y;

    ArrayList<Mountain> mountains;

    float speed;
    background(float x, float y, float speed){
        this.x = x;
        this.y = y;

        this.speed = speed;

        this.mountains = new ArrayList<Mountain>();
        // Create mountains with different colors
        mountains.add(new Mountain(0, 0.01, 80, y - 50, color(50, 100, 50)));
        mountains.add(new Mountain(0, 0.008, 60, y - 30, color(80, 130, 80)));
        //this.speed = speed;
    }

    void displayRoad(){
        fill(50);
        rect(x, y, width+300, height/2);

        fill(0);
        for (int i = 0; i < width; i += 40){
            rect(x + i, y + height/4 - 5, 20, 10);
        }
    }

    void moveRoad(float speed){
        displayRoad();
        x -= speed;
        if (x <= -40){
            x = 0;
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
        if (toggle) {
            background(135, 206, 235);
        } if (!toggle) {
            background(0);
        }
    }

}