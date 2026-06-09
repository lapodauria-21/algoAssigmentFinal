class stars{
    PVector positionOfStars;
    float sizeOfStars;

    stars() {
        float offsetX = randomGaussian() * width;
        float offsetY = randomGaussian() * height;

        positionOfStars = new PVector(width/2 + offsetX, height/2 + offsetY);

        sizeOfStars = random(1, 3 + (randomGaussian() * 2));
    }

    void displayStars() {
        fill(255);
        noStroke();
        ellipse(positionOfStars.x, positionOfStars.y, sizeOfStars, sizeOfStars);
    }

}