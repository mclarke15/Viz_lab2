class Data { 
  String name;
  int price;
  float x, y, rect_width, rect_height;
  int rect_color;
 
  Data (String n, int p) {  
    name = n; 
    price = p; 
  }
  void draw_rect(float x_pos, float y_pos, float x_width, float y_height) {
    x = x_pos;
    y = y_pos;
    rect_width = x_width;
    rect_height = y_height;
    fill(240);
    rect(x,  y, rect_width, rect_height);
    text(name, x, (y + y_height) + 10);
    textSize(rect_width * .3);
  }
  void check_bar() {
    //print("Mouse x: " + mouseX + "\n");
    //print("Mouse y: " + mouseY + "\n");
    //print("x: " + x + "\n");
    //print("y: " + y + "\n");
    //print("end x: " + (x + rect_width) + "\n");
    //print("end y: " + (y + rect_height) + "\n");
    //print(name + "\n");
    //print(price + "\n");
    if (x  < mouseX && mouseX > x + rect_width) {
      if (y < mouseY && mouseX > y + rect_height) {

      }
    }   
  }

}