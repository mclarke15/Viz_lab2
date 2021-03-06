class Data { 
  String name;
  int price;
  float x, y, rect_width, rect_height;
  int rect_color = #63cbc8;
  int tooltip_color = #63cbc8;
 
  Data (String n, int p) {  
    name = n; 
    price = p; 
  }
  void draw_rect(float x_pos, float y_pos, float x_width, float y_height) {
    x = x_pos;
    y = y_pos;
    rect_width = x_width;
    rect_height = y_height;
    fill(rect_color);
    rect(x,  y, rect_width, rect_height);
    textSize(rect_width * .25);
    fill(0);
    text(name, x, y + rect_height, rect_width, y + rect_height);
    textAlign(CENTER);
  }
  void check_bar() {
    float left_x = x;
    float right_x = x + rect_width;
    float top_y = y;
    float bottom_y = y + rect_height;
    
    if ((left_x  < mouseX && mouseX < right_x) &&
        (top_y < mouseY && mouseY < bottom_y)) {
      rect_color = #e9bed7;
      tooltip_color = 240;
      String tooltip = String.format("(%s,%d)", name, price);
      fill(240);
      rect(mouseX + 10, mouseY - 10, textWidth(tooltip) + 10, 15);
      fill(0);
      text(tooltip, mouseX + 10, mouseY - 10, textWidth(tooltip), 15);
    } else {
      rect_color = #63cbc8;
    }
    
  }

}