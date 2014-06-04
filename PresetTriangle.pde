int resolutionX = 1600;
int resolutionY = 900;
PVector a, b, c, d, e, f, g, h, j,changer;
//sets up first variable
int randX = (int )(Math.random() * resolutionX + 1);
int randY = (int )(Math.random() * resolutionY + 1);

//sets number of points
int endpts = 5;
//max length of 9 points
PVector[] points = new PVector[9];


int refreshRate = 1000;

//counter for initializing first points
int i = 0;

void setup() {
  size(resolutionX, resolutionY);  
  stroke(255, 15);
  //random starting position
  changer = new PVector(randX, randY);
  //initializes all other points but only chooses from endpts
  a = new PVector(0, resolutionY);
  points[0] = a; //point #1
  b = new PVector(resolutionX,resolutionY);
  points[1] = b; //point #2
  c = new PVector(resolutionX*.33333,1);
  points[2] = c; //point #3
  d = new PVector(resolutionX*.66666,1);
  points[3] = d; //point #4
  e = new PVector(resolutionX/2,resolutionY/2);
  points[4] = e; //point #5
  f = new PVector(resolutionX/.66666,resolutionY/3);
  points[5] = f; //point #6
  g = new PVector(resolutionX/2, resolutionY/3);
  points[6] = g; //point #7
  h = new PVector(resolutionX-300,300);
  points[7] = h; //point #8
  j = new PVector(1,1);
  points[8] = j; //point #9
  if (endpts < 4) {
  refreshRate = 200;
  }
  
  background(0);
  //loop();
}
boolean firstDraw = true;
boolean inputEndpts = false;

void draw() {
  if (firstDraw) {
    //where things are written
    textSize(20);
    text("Press 's' at any time to save screen", resolutionX-400, 780);
    text("Outputting a picture with " + endpts + " endpoints (press spacebar to continue)", 50, 100);
    if (key == ' ') {
      background(0);
      //makes first points heavy
      for (int w=0; w<20; w++) {
        point(points[i].x,points[i].y);
      }
      firstDraw = false;
      
    }
  }
  else {
    for (int x=0; x<refreshRate; x++) {
      int choice = choosePts(endpts);
      if (choice%2==0) { //if (choice ==endpts-1) {
        //stroke((int )(Math.random() * 255+1),40 ,54, 20);
        changer.x = int((points[choice].x+changer.x)/2);
        changer.y = int((points[choice].y+changer.y)/2); 
      }
      else {
        //used for more entropy
        //stroke(100,(int )(Math.random() * 255+1) ,54, 20);
        changer.x = int((points[choice].x+changer.x)/2);
        changer.y = int((points[choice].y+changer.y)/2);   
      }
      point(changer.x, changer.y);
      //line(oldX,oldY,changer.x,changer.y);
    }
      
  }
}

int choosePts(int endpts) {
  int choice = (int )(Math.random() * endpts);
  return choice;
}

void keyPressed() {
  if (key == 's') {
    save("newPiramid" + endpts + ".tif");
  }
}
//------------good coordinates------------------------------
  //with half /1 instead of /2 
  /*
  a = new PVector(0,10);
  points[0] = a; //point #1
  b = new PVector(resolutionX,10);
  points[1] = b; //point #2
  c = new PVector(400,resolutionY);
  points[2] = c; //point #3
  d = new PVector(resolutionX-400,resolutionY);
  points[3] = d; //point #4
  e = new PVector(800,450);
  points[4] = e; //point #5
  f = new PVector(800,450);
  points[5] = f; //point #6
  g = new PVector(800,450);
  points[6] = g; //point #7
  h = new PVector(500,500);*/
//------------unnecessary code------------------------------
/*if (i !=endpts) {
        if (mousePressed==true) {
          points[i] = new PVector(mouseX,mouseY);
          //makes first points heavy
          for (int w=0; w<20; w++) {
            point(points[i].x,points[i].y);
          }
          mousePressed=false;
          i++;
        }
      
    }
    else {*/
      /*used for lines
      int oldX = (int )changer.x;
      int oldY = (int )changer.y;*/
