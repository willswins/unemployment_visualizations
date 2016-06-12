class VisualizationOne implements Visualization
{
  /**
  Add visualization logic in this method. 
  This method gets called from the main class.
  
  */
  
  FloatTable data;
  float dataMin, dataMax;
  
  int quarterMin, quarterMax;
  int [] quarters;
    
  public void draw()
  {
    data = new FloatTable("unitedstates.tsv");
    quarters = int(data.getRowNames());
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
    drawDataPoints(0);
  }
  
  public void drawDataPoints(int col){
    int rowCount = data.getRowCount();
    for (int row = 0; row< rowCount; row++){
      if (data.isValid(row,col)) {
        float value = data.getFloat(row,col);
        float x = map(quarters[row], quarterMin, quarterMax, plotX1, plotX2);
        float y = map(value, dataMin, dataMax, plotY2, plotY1);
        point(x, y);
      }
    }
  }
}