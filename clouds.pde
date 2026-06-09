class Cloud {
PVector positionOfClouds;
float speedOfClouds;

//ArrayList<Cloud> clouds;

Cloud() {
    this.positionOfClouds = new PVector(random(width), random(height/2));
    this.speedOfClouds = 0.5;
    //this.clouds = new ArrayList<Cloud>();
}

void CreateClouds() {
    fill(255);
    noStroke();
    ellipse(positionOfClouds.x, positionOfClouds.y, 60, 40);
    ellipse(positionOfClouds.x + 20, positionOfClouds.y + 10, 50, 30);
    ellipse(positionOfClouds.x - 20, positionOfClouds.y + 10, 50, 30);
}

void updateClouds() {
    positionOfClouds.x += speedOfClouds;
    if (positionOfClouds.x > width + 60) {
        positionOfClouds.x = -60;
        positionOfClouds.y = random(height/2);
    }
}


void displayClouds() {
    CreateClouds();
    updateClouds();
}
}
