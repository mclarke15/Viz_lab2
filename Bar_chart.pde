class Bar_chart { 
  int x_count;
  int y_max = 0;
  float x_start, x_end;
  float y_start, y_end;
  int bar_width;
  Data[] myData;
  
  Bar_chart (int width, int height, Data[] data) {  
     myData = data;
     x_start = width * .1;
     x_end = width * .9;
     y_start = height * .8;
     y_end = height * .1;
     x_count = data.length;
     for (int i = 0; i < data.length; i++) {
       if (data[i].price > y_max) {
           y_max = data[i].price;
       }
     }
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
    fill(#63cbc8);
    textSize(displayWidth * .03);
    text("L1", x_end + 5, y_start);
    text("L2", x_start, y_end - (y_end * .1));    
  }
  
  void make_bars()
  {
    for (int i = 0; i < myData.length; i++) {
      float bar_width = (x_end - x_start) / x_count; 
      myData[i].draw_rect(x_start + bar_width * i, y_start - myData[i].price, bar_width, myData[i].price);
    }
  }
  void check_bars() {
    for (int i = 0; i < myData.length; i++) {
      myData[i].check_bar();
    }

  }
}