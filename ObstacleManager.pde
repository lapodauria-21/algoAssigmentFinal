class ObstacleManager{
    ArrayList<Obstacle> obstacle;
    int spawnTimer;
    ObstacleManager(){
        obstacle = new ArrayList<Obstacle>();
        spawnTimer = 0;
    }
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
    void display(){
        for (Obstacle obs : obstacle){
            obs.display();
        }
    }

    boolean checkForCollision(PVector pos, float carWidth, float carHeight){
        for (Obstacle obs : obstacle){
            if (obs.isHit(pos,carWidth,carHeight)){
                obs.triggerTheHit();
                return true;
            }
        }
        return false;
    }

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