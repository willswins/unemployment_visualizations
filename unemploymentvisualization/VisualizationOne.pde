class VisualizationOne implements Visualization
{
  /**
  Add visualization logic in this method. 
  This method gets called from the main class.
  
  */
  
  FloatTable data;
  float dataMin, dataMax;
  
  float quarterMin, quarterMax;
  float [] quarters;
  
  int currentColumn = 0;
  int columnCount;

    
  public void draw()
  {
    data = new FloatTable("unitedstates.tsv");
    quarters = float(data.getRowNames());
    quarterMin = quarters[0];
    quarterMax = quarters[quarters.length-1];
    println("quarters " + str(quarters[0]));
    
    dataMin = 0;
    dataMax = data.getTableMax();
    
    println("US Unemployment Rates");
    //setBackGround(55);
    setTitle("US Unemployment Rates");
    setSubTitle("Quarterly unemployment rates for the US from 2009-2013");
    
    fill(255);
    rectMode(CORNERS);
    noStroke();
    rect(plotX1, plotY1, plotX2, plotY2);
    
    strokeWeight(5);
    stroke(#5679C1);
    noFill();
    strokeWeight(2);
    noFill();
    drawDataLine(currentColumn);
    drawDataHighlight(currentColumn);
  }
  
  //public void drawDataPoints(int col){
  //  int rowCount = data.getRowCount();
  //  for (int row = 0; row< rowCount; row++){
  //    if (data.isValid(row,col)) {
  //      float value = data.getFloat(row,col);
  //      println(value);
  //      float x = map(quarters[row], quarterMin, quarterMax, plotX1, plotX2);
  //      float y = map(value, dataMin, dataMax, plotY2, plotY1);
  //      point(x,y);
  //    }
  //  }
  //}
  
  void drawDataLine(int col){
    beginShape();
    int rowCount = data.getRowCount();
    for (int row = 0; row< rowCount; row++){
      if (data.isValid(row,col)) {
        float value = data.getFloat(row,col);
        println(value);
        float x = map(quarters[row], quarterMin, quarterMax, plotX1, plotX2);
        float y = map(value, dataMin, dataMax, plotY2, plotY1);
        vertex(x,y);
      }
    }
    endShape();
  }
  
  void drawDataHighlight(int column){
    int rowCount = data.getRowCount();
    for (int row = 0; row< rowCount; row++){
      if (data.isValid(row,column)) {
        float value = data.getFloat(row,column);
        println(value);
        float x = map(quarters[row], quarterMin, quarterMax, plotX1, plotX2);
        float y = map(value, dataMin, dataMax, plotY2, plotY1);
        if (dist(mouseX, mouseY, x, y) < 3){
          strokeWeight(10);
          point(x,y);
          fill(0);
          textSize(10);
          textAlign(CENTER);
          text(nf(value, 0, 2) + " (" + quarters[row] + ")", x, y-8);
        }
      }
    }
  }
  
  void keyPress(){
  if (key =='[') {
    currentColumn--;
    if (currentColumn < 0){
      currentColumn = columnCount -1;
    }
    else if (key ==']'){
      currentColumn++;
      if (currentColumn == columnCount) {
        currentColumn = 0;
      }
    }
  }
}
  
}