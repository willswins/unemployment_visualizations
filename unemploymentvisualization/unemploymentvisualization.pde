/**
 
 Week 5 & 6  - Week 5/6 Group Project - Advanced Interactive 
 Visualizations in Processing Environment (START PROJECT)
 
 Find an interesting time series datasets online. 
 Goal is to tell a story about these time 
 series with a Processing sketch visualization.
 
 Using the time series examples from the Ben Fry book, 
 write a Processing sketch which does the following:
 1.Displays your time series
 2.Displays a title describing the type of data being visualized
 3.Displays names of the different time series you loaded – 
 these could be tabs or a legend-like display on the side of the plot
 4.Visualizes the time series
 5.The visualization should include axis marks, labels, and gridlines
 
 Author: Group 1
 
 */

int screenToggle = 0;
int screenToggleOld = 0;
boolean firstRun = true;
Visualization  one;
Visualization  two;
Visualization  three;
Visualization currentVisualization;
float plotX1, plotY1;
float plotX2, plotY2;
  


/**
 setup method that does all the initial setup work.
 */
void setup()
{
  //Corners of the plotted time series
  plotX1 = 50;
  plotX2 = width - plotX1;
  plotY1 = 60;
  plotY2 = height - plotY1;
  
  // steps to perform at start up
  one  =new VisualizationOne();
  two  =new VisualizationTwo();
  three=new VisualizationThree();
  
  smooth();
}




/**
 Draw method for the main class.
 */
public void draw() {

  // check to not re-draw if screen toggle has not changes. 
  // redraw only when user has pressed the space bar. 
  if (!firstRun && screenToggleOld == screenToggle) {
    return;
  } else {
    firstRun = false;
    screenToggleOld = screenToggle;
  }
    println("draw Visualization");
  setBackGround(255);

  // Screen toggle logic to change display when space bar is pressed.
  switch (screenToggle) {
    case 0:
      currentVisualization = one;
      break;
    case 1:
      currentVisualization = two;
      break;
    case 2:
      currentVisualization = three;
      break;
    default:
      println("Error: Unknown option");
      break;
    }
    currentVisualization.draw();
}

/**
 draw title
 */
void setTitle(String title)
{
  textSize(20);
  fill(0, 102, 153);
  text(title, 230, 20);
}



/**
 draw Sub title
 */
void setSubTitle(String subTitle)
{
  textSize(15);
  fill(153, 102, 0);
  text(subTitle, 380, 470);
}


void setBackGround(int bgColor)
{
  background(bgColor);
}



/**
 check if a space bar is pressed. 
 If yes then increment the toggle value 
 */
public void keyReleased() {
    println("Key=" + key);
    println("KeyCode=" + keyCode);
    if (32 == keyCode) {
      screenToggleOld = screenToggle;
      screenToggle = (screenToggle + 1) % 3;
      println("screenToggle=" + screenToggle);
    } else {
      currentVisualization.keyReleased();
      currentVisualization.draw();
    }
  }


/**
 dipslay screen size
 */
public void settings() {
  size(640, 480);
}