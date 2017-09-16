int displayWidth = 800;
int displayHeight = 600;
Bar_chart myChart;
Data[] data;
void setup()
{ 
  size(displayWidth, displayHeight);
  surface.setResizable(true);
  String[] lines = loadStrings("data.csv");
  data = new Data[lines.length - 1];
  for(int i = 1; i < lines.length; i++){
    String[] content = split(lines[i], ",");
    data[i-1] = new Data(content[0], int(content[1]));
  }

  printArray(data);
}

void draw() 
{
  background(204);
  surface.setSize(width, height);
  myChart = new Bar_chart(width, height, data);
  myChart.update(); 
  myChart.check_bars();
}