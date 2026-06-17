/*
this was part of an assigment for week 2 we had to use Perlin noise to crete a mountain
*/

// create the class with the parameters that we need
class Mountain {

  float noiseOff;
  float scrollSpeed;
  float noiseStep;
  float baseY; 
  float amplitude; //max height of mountain
  color col;

  // construct obj
  Mountain(float scrollSpd, float nStep, float amp, float base, color c) { // we need this specifc parameters when er create this object

    scrollSpeed = scrollSpd;
    noiseStep = nStep;
    amplitude = amp;
    baseY = base;
    col = c;
  }

  // gets mountain height at a specific x position
  float heightAt(int px) {
    // moise gives smooth terrain and map converts values into screen coordinates
    return map(noise(noiseOff + px * noiseStep), 0, 1, baseY - amplitude, baseY);
  }

  // update the scrollin speed
  void update() {
    noiseOff += scrollSpeed;
  }

  // method to display the mopuntain
  void display() {


    fill(col);
    noStroke();
    beginShape();
    vertex(0, height);

    // Draw mountain edge
    for (int x = 0; x <= width; x++) {

      vertex(x, heightAt(x));
    }
    vertex(width, height);
    endShape(CLOSE);
  }
}