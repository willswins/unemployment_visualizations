class VisualizationTwo implements Visualization
{
  public void draw()
  {
    println("Second Visualization");
    //setBackGround(155);
    setTitle("Second Visualization",plotX1, plotY1-10);
    setSubTitle("Second Visualization - SubTitle");
  }


  public void keyReleased()
  {
    println("Two: "+key);
  }
  public void mouseMoved() {
    // TODO Auto-generated method stub
  }
  
  void mouseWheel(MouseEvent event){};
}