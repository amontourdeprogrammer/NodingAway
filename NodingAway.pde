Node[] listOfNodes =  { 
  new Node(random(255), random(255), 3,4), 
  new Node(random(255), random(255), 3,4) 
};

void setup(){
  size(300,300);
  
}

void draw(){
  background(0);
  for(Node n : listOfNodes){
    n.move();
    n.display();
  }

  
}

class Node {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  Node(float tempX, float tempY, float tempxspeed, float tempyspeed) {
    x = tempX;
    y = tempY;
    xspeed = tempxspeed;
    yspeed = tempyspeed;
  }
  
    void move() {
    // Add gravity to speed
    x = x + xspeed;
    // Add speed to y location
    y = y + yspeed;
    // If square reaches the bottom
    // Reverse speed
    if (y > height) {
      // Dampening
      yspeed = yspeed * -1;
      y = height;
    }
    if (x > width) {
      // Dampening
      xspeed = xspeed * -1;
      x = width;
    }
  }

  void display() {
    // Display the circle
    fill(255,0,0);
    //stroke(0,life);
    ellipse(x,y,30,30);
  }
 }