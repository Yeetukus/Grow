PFont font;
float wallloc = 0;
ArrayList<root> roots = new ArrayList<root>();
bg bg;
menu mn;
float speed = 0.1;
float cloudHigh = 0;
int delay = 0;

boolean toMoon = false;
boolean menu = true;
void setup() {
  rectMode(CENTER);
  colorMode(RGB);
  textAlign(CENTER);
  fullScreen(P2D);
  bg = new bg();
  mn = new menu();
  font = loadFont("ProcessingSansPro-Regular-30.vlw");
  textFont(font);
  background(0);

  strokeWeight(10);
}


void draw() {
  if (menu == false) {
    bg.render();
    if (bg.B < 1 && bg.G < 1 && bg.B < 1) {
      delay++;
    }

    for (root part : roots) {
      part.render();
    }
  } else {
    mn.render();
  }
}

void mousePressed() {
  if (menu == false) {
    for (root part : roots) {
      if (abs(mouseX - part.locs.get(part.locs.size()-1).x) < 25 && mouseY > height/2-25 && mouseY<height/2+25) {
        if (part.slope < 0) {
          part.slope = random(-part.speed/20, part.speed);
        } else {
          part.slope = random(-part.speed, part.speed/20);
        }
      }
    }
  }
}
