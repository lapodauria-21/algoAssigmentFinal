/*
Class to create the start and we five them an of set from the point of origin thanks to gauassian distribution
*/
class Stars{
    PVector positionOfStars;
    float sizeOfStars;

    // constroctur to inzizialize the variables
    Stars() {
        float offsetX = randomGaussian() * (width/4); // gauassian distribution for the offset --> a lot of stars close to the median some execptions
        float offsetY = randomGaussian() * height;

        positionOfStars = new PVector(width/2 + offsetX, height/2 + offsetY);

        sizeOfStars = random(1, 3 + (randomGaussian() * 2)); // size based on gauassian distribution
    }

    // display the stars
    void displayStars() {
        fill(255);
        noStroke();
        ellipse(positionOfStars.x, positionOfStars.y, sizeOfStars, sizeOfStars);
    }

}