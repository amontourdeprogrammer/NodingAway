ArrayList<Node> listOfNodes = new ArrayList<Node>();
ArrayList<IntList> source = new ArrayList<IntList>();

void setup(){
  size(600,600);
  
      source = dealwithjson();
      for (IntList topic : source){
        int recent = topic.get(3);
        int category_id = topic.get(0);
        int topic_id = topic.get(1);
        int post_count = topic.get(2);
        println(post_count);
        listOfNodes.add(new Node(random(200) + 200, random(200) + 200, 10/recent, 5/recent, category_id, topic_id));
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



 
void linking(Node n1, Node n2){
   float distance = dist(n1.x, n1.y, n2.x, n2.y);
   colorMode(RGB, 255);
   stroke(map(distance, 0, 300, 200, 240));
   line(n1.x, n1.y, n2.x, n2.y);
   
 }
 

 
 
 
 