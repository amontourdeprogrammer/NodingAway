ArrayList<Node> listOfNodes = new ArrayList<Node>();
JSONObject json;


void setup(){
  size(600,600);
  
  json = loadJSONObject("http://communaute.amontourdeprogrammer.fr/categories.json");
  JSONObject categories_list = json.getJSONObject("category_list");
  JSONArray categories= categories_list.getJSONArray("categories");
  
  for (int i = 0; i < categories.size(); i++){
    JSONObject category = categories.getJSONObject(i); 
    int category_id = category.getInt("id");
    JSONObject posts = loadJSONObject("http://communaute.amontourdeprogrammer.fr/c/" + category_id +".json");    
    JSONObject topics_page = posts.getJSONObject("topic_list");
    JSONArray topic_list = topics_page.getJSONArray("topics");
    
    for (int j = 0; j < topic_list.size(); j++){
      JSONObject topic = topic_list.getJSONObject(j);
      int post_count = topic.getInt("posts_count");
      int topic_id = topic.getInt("id");
    
      String timepost;
      if (topic.isNull("last_posted_at")){
        timepost = topic.getString("created_at");
        }else {
        timepost = topic.getString("last_posted_at");
        }
      String test = timepost;
      String yearstr = test.substring(0,4);
      int year = Integer.parseInt(yearstr);
      String monthstr = test.substring(5,7);
      int month = Integer.parseInt(monthstr);
      String daystr = test.substring(8,10);
      int day = Integer.parseInt(daystr);
      int date = year*365+month*30+day;
      int today = year()*365+month()*30+day();
      int recent;
      if(date<today){
        recent = today-date;
        }else{
          recent=1;
        }
      for (int k = 0; k < post_count; k++){
        listOfNodes.add(new Node(random(200) + 200, random(200) + 200, 10/recent, 5/recent, category_id, topic_id ));
      }
    }
   }
  }


void draw(){
  colorMode(RGB, 255);
  background(255);
  for(Node n : listOfNodes){
    n.move();
    
    for(Node m : listOfNodes){
      if(n.topic_id == m.topic_id){
      linking(n, m);
      }
    };
    
    n.display();
  }
}


class Node {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  int nodecolor;
  int topic_id;
  
  Node(float tempX, float tempY, float tempxspeed, float tempyspeed, int tempnodecolor, int temptopic_id) {
    x = tempX;
    y = tempY;
    xspeed = tempxspeed;
    yspeed = tempyspeed;
    nodecolor = tempnodecolor;
    topic_id = temptopic_id;
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
    ellipse(x,y,10,10);
  }
 }
 
void linking(Node n1, Node n2){
   float distance = dist(n1.x, n1.y, n2.x, n2.y);
   colorMode(RGB, 255);
   stroke(map(distance, 0, 300, 200, 240));
   line(n1.x, n1.y, n2.x, n2.y);
   
 }
 

 
 
 
 