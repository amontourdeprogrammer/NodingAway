class Node {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  int nodecolor;
  int topic_id;
  int node_size;
  
  Node(float tempX, float tempY, float tempxspeed, float tempyspeed, int tempnodecolor, int temptopic_id, int tempnode_size) {
    x = tempX;
    y = tempY;
    xspeed = tempxspeed;
    yspeed = tempyspeed;
    nodecolor = tempnodecolor;
    topic_id = temptopic_id;
    node_size = tempnode_size;
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
    colorMode(HSB, 15);
    fill(nodecolor, 15, 10);
    noStroke();
    ellipse(x,y,node_size*4,node_size*4);
  }
 }