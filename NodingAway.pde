Node[] listOfNodes =  { 
  new Node(random(255), random(255), random(2),random(2)), 
  new Node(random(255), random(255), random(2),random(2)), 
  new Node(random(255), random(255), random(2),random(2)), 
  new Node(random(255), random(255), random(2),random(2))
};

void setup(){
  size(300,300);
  
}

void draw(){
  background(255);
  for(Node n : listOfNodes){
    n.move();
    n.display();
    for(Node m : listOfNodes){
      linking(n, m);
    }
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
    
    x = x + xspeed;
    y = y + yspeed;
   
    if (y > height) {
      yspeed = yspeed * -1;
      y = height;
    }
    if (x > width) {
      xspeed = xspeed * -1;
      x = width;
    }
    if (y < 0) {
      yspeed = yspeed * -1;
      y = 0;
    }
    if (x < 0 ) {
      xspeed = xspeed * -1;
      x = 0;
    }
  }

  void display() {
    // Display the circle
    fill(149,149,149, 149);
    noStroke();
    ellipse(x,y,10,10);
  }
 }
 
void linking(Node n1, Node n2){
   if (dist(n1.x, n1.y, n2.x, n2.y) <136) {
     stroke(126);
     line(n1.x, n1.y, n2.x, n2.y);
   }
 }
 
 
 
 