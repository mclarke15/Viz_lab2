int displayWidth = 400;
int displayHeight = 300;
Bar_chart myChart;

void setup()
{ 
  size(displayWidth, displayHeight);
  
  String[] lines = loadStrings("data.csv");
  Data[] data = new Data[lines.length - 1];
  for(int i = 1; i < lines.length; i++){
    String[] content = split(lines[i], ",");
    data[i-1] = new Data(content[0], int(content[1]));
  }
  
  myChart = new Bar_chart(displayWidth, displayHeight, data);

  printArray(data);
}

void draw() 
{
  background(204);
  myChart.update(); 
}