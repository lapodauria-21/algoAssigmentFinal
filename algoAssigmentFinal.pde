/*
this is the main class 
we only create the most important objects here
that is the car
*/
// variables that are usually modified by other clasees --> can be assigned only once
final int N_Stars = 1000;
final int N_birds = 40;
final int N_particles = 5;
final int N_clouds = 10;

// we are creating the object responsable for having the whole scene
Scene scene;
void setup(){
    fullScreen();
    noSmooth();
    scene = new Scene(N_birds, N_Stars, N_particles, N_clouds);
}
// method to draw each frame
void draw(){
    background(255);
    scene.updateScene();
    scene.displayScene();
}
//Method that check if a key was pressed and call the method in scene parsing the key
void keyPressed(){
    scene.handleKeyPressed(keyCode);
}
// same as before but just while key is realesed
void keyReleased(){
    scene.handleKeyReleased();
}
//call methood with PVector (moiuse position) as parameter
void mousePressed(){
    PVector click = new PVector(mouseX, mouseY);
    scene.handleClick(click);
}

// method that read position of mouse
void mouseMoved(){
   scene.handleMouseMuvment(new PVector(mouseX, mouseY));
}