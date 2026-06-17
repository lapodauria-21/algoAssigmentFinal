/*
class for the cloud
we base the movment on PV vectors that stats with a random position
*/

// class where we create the variables that we need
class Cloud {
PVector positionOfClouds;
float speedOfClouds;

// constructor to inizialize the variables
Cloud() {
    this.positionOfClouds = new PVector(random(width), random(height/2)); // based on a random position on the top side of the screen
    this.speedOfClouds = 0.5; // speed of the cloud
}
//method to create clouds based on the position
void CreateClouds() {
    fill(255);
    noStroke();
    ellipse(positionOfClouds.x, positionOfClouds.y, 60, 40);
    ellipse(positionOfClouds.x + 20, positionOfClouds.y + 10, 50, 30);
    ellipse(positionOfClouds.x - 20, positionOfClouds.y + 10, 50, 30);
}
// method to update the clouds
void updateClouds() {
    positionOfClouds.x += speedOfClouds; // we increment the position with the speed and when the clouds are out of the scene 
    if (positionOfClouds.x > width + 60) {
        positionOfClouds.x = -60; // start with position of -60
        positionOfClouds.y = random(height/2); // random position of y
    }
}
// method to display the clouds
void displayClouds() {
    CreateClouds();
    updateClouds();
}
}
