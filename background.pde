// clas for backfeound
class background{
    float x, y;
    //float speed;
    background(float x, float y){
        this.x = x;
        this.y = y;
        //this.speed = speed;
    }

    void displayRoad(){
        fill(50);
        rect(x, y, width, height/2);

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


}