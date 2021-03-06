class numberLine {
  
  float counterMCR, counterMM, myHeight, myWidth;
  float prevZoom, distance, myDistance, curZoom, istart, iend, centerY, centerX; 
  color lineStroked;
  
  numberLine(color stroked, float zoneHeight, float zoneWidth, boolean centered){
    stroke(lineStroked);
    myHeight = zoneHeight;
    myWidth = zoneWidth;
    myDistance = 100.0;
    distance = 100;
    prevZoom=1;
    //czoom=1;
    lineStroked = stroked;
    centerY = 0;
    if (centered) {
      centerX = 0;
      // if the plane is centered then the start
      // of the numberline has to be at -width/2 
      //but we want the line to start and end just before the edges of the screen
      istart = (-zoneWidth/2)+50;
      iend = (zoneWidth/2)-50;
    }
    else {
      centerX = width;
      istart = zoneWidth-50;
      iend = zoneWidth-50;
    }
    
}


void display(){
  stroke(lineStroked);
  line( istart, centerY, iend, centerY);
  
  //first lot of lines (centimeters)
  float counterCM=0.0;
  for (float i = istart; i < iend; i += distance){
          strokeWeight(0.5);
          line((int) i, centerY-5, (int) i, centerY+5);
          showText(distance/4, counterCM,i,centerY+5+(distance/4),0);
          //second line in milimeters
          counterMM = counterCM;
          
          
            for (float j = i; j < i+distance; j += distance/10){
              strokeWeight(distance/250);
              line((int) j, centerY-2, (int) j, centerY+2);
              if (j==i || j==i+distance){}
              else
                showText(distance/60, counterMM, j, centerY+3+(distance/60),1); 
               //third line in micrometers
              counterMCR = counterMM;
              
              for (float k = j; k < j+distance/10; k += distance/100){
                strokeWeight(distance/450);
                line((int) k, centerY-0.5, (int) k, centerY+0.5);
                if (k==j || k==j+distance){}
                else
                  showText(distance/300, counterMCR, k, centerY+2,2); 
                counterMCR+=0.01;
              }
              counterMM+=0.10;
            }
            counterCM++;
  }
  
}

  void showText(float textSize, float number, float xPos, float yPos, int decimals){
 
 
  String myText;
   pushStyle();
   noStroke();
   textAlign( CENTER, BOTTOM);
   myFont = createFont("serif", textSize);//added
   textFont(myFont);//added
   //textSize(textSize);
   //fill(lineStroked);
  
   myText = nf(number,1,decimals); //added
   text(myText, xPos, yPos);
   popStyle(); 

  }

}
