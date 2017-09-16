class Bar_chart { 
  int x_count;
  int y_max = 0;
  float x_start, x_end;
  float y_start, y_end;
  float bar_width, space_width;
  Data[] myData;
  
  Bar_chart (int width, int height, Data[] data) {  
     myData = data;
     x_start = width * .1;
     x_end = (width * .9);
     y_start = height * .8;
     y_end = (y_start - maxPrice() * 2);
     x_count = data.length;
     bar_width = ((x_end - x_start) / x_count) * .9;
     space_width = ((x_end - x_start) / x_count) * .1;
     for (int i = 0; i < data.length; i++) {
       if (data[i].price > y_max) {
           y_max = data[i].price;
       }
     }
  }
  float maxPrice() {
    float max_price = 0;
    for (int i = 0; i <myData.length; i++) {
      max_price = (myData[i].price > max_price ? myData[i].price : max_price);
    }
    return max_price;
  }
  
  void update() {
    draw_lines();
    make_bars();
  }
  void draw_lines() {
    line(x_start, y_start, x_end, y_start); // x axis
    stroke(126);
    line(x_start, y_start, x_start, y_end); // y axis
    stroke(126);
    fill(0);
    textSize(displayWidth * .03);
    text("L1", x_end + (x_end * .02), y_start);
    text("L2", x_start, y_end - (y_end * .1));    
  }
  
  void make_bars()
  {
    for (int i = 0; i < myData.length; i++) {
      myData[i].draw_rect((x_start + bar_width * i) + (space_width * i), y_start - (myData[i].price * 2), bar_width, myData[i].price * 2);
    }
    label_y();
  }
  void check_bars() {
    for (int i = 0; i < myData.length; i++) {
      myData[i].check_bar();
    }

  }
  void label_y(){
    float max_price = 0;
    for (int i = 0; i < myData.length; i++) {
      if (myData[i].price > max_price) {
          max_price = myData[i].price;  
      }
    }
    float y_space =(y_start - y_end) / myData.length;
    int num = int(max_price / myData.length);
    for (int i = 0; i < myData.length; i++) {
      float dist_from_x = y_start - (y_space * i);
      text(num * i, x_start - (width * .03), y_start - (y_space * i)); 
      line(x_start, dist_from_x, x_end, dist_from_x);
    }
  }
}