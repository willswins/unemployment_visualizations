class VisualizationThree implements Visualization
{
  public void draw()
  {
    println("Third Visualization");
    // set backgroud as needed
    //setBackGround(255);
    setTitle("Third Visualization-Winny");
    setSubTitle("Third Visualization - SubTitle");
  }
  
  public void keyReleased()
  {
    println("Three: "+key);

  }
  
  
  
}