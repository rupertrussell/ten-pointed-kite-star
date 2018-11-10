// Draw a 10 pointed star from page 205 of
// Islamic Geometric Design by Eric Broug Published by Thames & Hudson
// by Rupert Russell
// artwork on Redbubble see:
// code on Github at: 

float scale = 600;

float xCenter = width /2;
float yCenter = height /2;

float[] innerX;
float[] innerY;

void setup() {

  size(700, 700); // width x height

  innerX = new float[10]; // store x Points for the 10 points on the inner circle
  innerY = new float[10]; // store y Points for the 10 points on the inner circle

  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  background(255);
  // noLoop();

  translate(xCenter, yCenter); 

  // rotate to turn points
  rotate(radians(-360/20));

  calculateNinnerPoints(10, 1);

  for (int x = 0; x < 10; x++) {

    //  turning point 1
    strokeWeight(4);
    line(innerX[2], innerY[2], scale * -0.0477, scale * -0.3285);

    //  turning point 2
    line(scale * -0.0477, scale * -0.3285, scale * 0.0955, scale * -0.1316);

    //  turning point 3
    line(scale * 0.0955, scale * -0.1316, scale * 0.3265, scale * -0.056 );

    //  turning point 4  (inner 3)
    line(scale * 0.3265, scale * -0.056, innerX[1], innerY[1]);
    rotate(radians(360/10));
  }
} // End Draw

void calculateNinnerPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor / 2 ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    innerX[counter] = x;
    innerY[counter] = y;
    counter ++;
  }
} // end  calculateNinnerPoints


void mousePressed() {
  scale = scale * 2;   // scale of bounding square
}

void mouseReleased() {
  scale = scale * .5; // scale of bounding square
}


void keyPressed() {
  if (key == 's' || key == 'S') {
    save("Ten_Pointed_Kite_Star_010.png"); 
    exit();
  }
}
