class Particle {
  PVector  location;
  color col;
  Particle () {
    location = new PVector(width/2, height/2);
  }
  void setLocation() {
    location.x = random(0, width);
    location.y = random(0, height);
  }
  void update() {
     location.x+= random(-5.0f, 5.0f);
     location.y += random(-5.0f, 5.0f);
  }
  void display() {
    pushStyle();
    blendMode(ADD);
    strokeWeight(3);
    stroke(col); 
    point(location.x, location.y);
    popStyle();
  }
}
