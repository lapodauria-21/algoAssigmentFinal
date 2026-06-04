void draw(){
  background(255);
  fill(0);
  textSize(20);
  text("Click to add points", 10, 30);
  
  // Draw the points
  for (PVector point : points) {
    fill(0);
    ellipse(point.x, point.y, 10, 10);
  }
  
  // If there are at least two points, draw the lines between them
  if (points.size() > 1) {
    stroke(0);
    for (int i = 0; i < points.size() - 1; i++) {
      PVector p1 = points.get(i);
      PVector p2 = points.get(i + 1);
      line(p1.x, p1.y, p2.x, p2.y);
    }
  }
}