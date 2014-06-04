int resolutionX = 1600;
int resolutionY = 900;
PVector a, b, c, d, e, f, g, h, j,changer;
//sets up first variable
int randX = (int )(Math.random() * resolutionX + 1);
int randY = (int )(Math.random() * resolutionY + 1);

//max length of 9 points
PVector[] points = new PVector[9];

//sets number of points
int endpts = 3;
int refreshRate = 1000000;
int i = 0;
String words = "Begin...";

void setup() {

  size(resolutionX, resolutionY);  
  stroke(255, 15);

  //random starting position
  changer = new PVector(randX, randY);
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
    //textFont(createFont("Georgia", 76));
    textSize(30);
    text("Enter the number of endpoints for your fractal", 50, 50);
    textSize(20);
    text("Press 's' at any time to save screen", resolutionX-400, 780);
    if (key >= '2' && key <= '9' && !inputEndpts) {
      endpts = key-48;
      background(0);
      text("Now input " + endpts + " endpoints (press spacebar to continue)", 50, 100);
      inputEndpts = true;
  }
    if (key == ' ' && inputEndpts) {
      firstDraw = false;
      background(0);
    } 
  }
  else {
    if (i !=endpts) {
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
      else {
        int oldX = (int )changer.x;
        int oldY = (int )changer.y;
        for (int x=0; x<refreshRate; x++) {
          int choice = choosePts(endpts, endpts);
          if (choice ==endpts-1) {
            //stroke((int )(Math.random() * 255+1),40 ,54, 20);
            changer.x = int((points[choice].x+changer.x)/2);
            changer.y = int((points[choice].y+changer.y)/2); 
            
          }
          else {
           //stroke(100,(int )(Math.random() * 255+1) ,54, 20);
           changer.x = int((points[choice].x+changer.x)/2);
           changer.y = int((points[choice].y+changer.y)/2);   
          }
          point(changer.x, changer.y);
          //line(oldX,oldY,changer.x,changer.y);
        }
        
      }
  }
}

int choosePts(int total, int endpts) {
  int choice = (int )(Math.random() * endpts);
  return choice;
}

void keyPressed() {
  if (key == 's') {
    save("piramid" + endpts + ".tif");
  }
}
