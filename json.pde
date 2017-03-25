ArrayList<IntList> dealwithjson(){
  ArrayList<IntList> listoftopics = new ArrayList<IntList>();
  
  JSONObject json= loadJSONObject("http://communaute.amontourdeprogrammer.fr/categories.json");
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
      String topic_title = topic.getString("slug");
      println(post_count);
      println(topic_id);
      println(topic_title);
      
      
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
      IntList listOfInt = new IntList();

      listOfInt.append(category_id);
      listOfInt.append(topic_id);
      listOfInt.append(post_count);
      listOfInt.append(recent);
      listoftopics.add(listOfInt);
      
      
    }
  }

  return listoftopics;  
}