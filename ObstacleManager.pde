/*
class to deal with the array of obstacles -- spawn the obstacle display and check for coliision
*/

class ObstacleManager{
    ArrayList<Obstacle> obstacle;
    int spawnTimer;
    ObstacleManager(){
        obstacle = new ArrayList<Obstacle>();
        spawnTimer = 0;
    }
    // method to call the spawn function if speed > o and call the update function for every element in the array
    void update(float currentSpeed, float topRoad, float bottomRoad, float carWidth){
        if(currentSpeed > 0){
            spawn(currentSpeed, topRoad, bottomRoad, carWidth);
        }

            for (int i = obstacle.size() -1; i >= 0; i--){
            Obstacle obs = obstacle.get(i);
            obs.update(currentSpeed);

            if(!obs.active){
                obstacle.remove(i);
            }
        }
        
    }
    // display the elements in the array with an advance for loop
    void display(){
        for (Obstacle obs : obstacle){
            obs.display();
        }
    }

    // method that checks for every element if there was a collision and starts the timer --> advance for loop
    boolean checkForCollision(PVector pos, float carWidth, float carHeight){
        for (Obstacle obs : obstacle){
            if (obs.isHit(pos,carWidth,carHeight)){
                obs.triggerTheHit();
                return true;
            }
        }
        return false;
    }

    // method to spawn the tobject based on random position that is between the top of the road and the bottom 
    void spawn(float currentSpeed, float topRoad, float bottomRoad, float carWidth){
        spawnTimer ++;
        int spawnIntervall = max (40, 120 - (int) (currentSpeed *5));
        if(spawnTimer >= spawnIntervall){
            spawnTimer = 0;
            float spawnY = random(topRoad + 5, bottomRoad - carWidth - 10);
            obstacle.add(new Obstacle(width + 20, spawnY, currentSpeed));
        }
    }
}