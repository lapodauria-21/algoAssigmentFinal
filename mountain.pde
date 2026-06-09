class Mountain {

  float noiseOff;
  float scrollSpeed;
  float noiseStep;
  float baseY; 
  float amplitude; //max height of mountain
  color col;

  // construct obj
  Mountain(float scrollSpd, float nStep, float amp, float base, color c) {

    scrollSpeed = scrollSpd;
    noiseStep = nStep;
    amplitude = amp;
    baseY = base;
    col = c;
  }

  // gets mountain height at a specific x position
  float heightAt(int px) {
    // moise gives smooth terrain and map converts values into screen coordinates
    return map(
      noise(noiseOff + px * noiseStep), 0, 1, baseY - amplitude, baseY);
  }

  void update() {
    noiseOff += scrollSpeed;
  }

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