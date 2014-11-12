/* @pjs globalKeyEvents="true"; */  //addded

// zoom in a ruller
float zoom;
// A vector to store the offset from the center
PVector offset;
// The previous offset
PVector poffset;
// A vector for the mouse position
PVector mouse;
// A font varaible is added
PFont myFont; //addtion

//the object to draw
numberLine myNumberLine;

color lineColour;


void setup() {
  size(1200, 600);
  zoom = 1.0;
  offset = new PVector(0, 0);
  poffset = new PVector(0, 0);
  lineColour = #cfd986;
  myFont = createFont("serif", 62);//added
  textFont(myFont);//added

  myNumberLine = new numberLine(lineColour,height/2, width, true);
  smooth();
}

// Zoom in and out w hen the key is pressed

// Zoom in and out w hen the key is pressed
void keyPressed() {
 if (key == 'a') {
    zoom += 0.3;
  } 
  else if (key == 'z') {
    zoom -= 0.3;
  }
  zoom = constrain(zoom,0,100);
}


void draw() {
  background(0);
  
  pushMatrix();
  // Everything must be drawn relative to center
translate(width/2, height/2);
  // Use scale for 2D "zoom"

  scale(zoom);



  // The offset (note how we scale according to the zoom)
 translate(offset.x/zoom, offset.y/zoom);
  
  // Draw just a single number line
myNumberLine.display();

popMatrix();
  
  // Draw some text
  textSize(32);
  fill(200);
  fill(lineColour);
 text("a: zoom in \nz: zoom out\nuse mouse to move",10,32);


  
}



// Store the mouse and the previous offset
void mousePressed() {
  mouse = new PVector(mouseX, mouseY);
  poffset.set(offset);
}

// Calculate the new offset based on change in mouse vs. previous offsey
void mouseDragged() {
  offset.x = mouseX - mouse.x + poffset.x;
  offset.y = mouseY - mouse.y + poffset.y;
}

