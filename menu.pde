class menu {
  int R = 255;
  int G = 255;
  int B = 255;
  float numRootSliderval = width/6;
  float speedSliderval = width/5;
  float[] hey = new float[10];
  boolean dir = true;
  color fillCol = color(255-R, 255-G, 255-B);
  color strokeCol = color(abs(205-R), abs(205-G), abs(205-B));
  void render() {
    fade();
    textSize(150);
    text("Grow", width/2, height/2);
    if (button(width/2, height/2+height/10, width/3, height/10)) {
      menu = false;
      R = 255;
      G = 255;
      B = 255;
      bg.R = 17;
      bg.G = 237;
      bg.B = 245;
      bg.fading = false;
      wallloc = 0;
      bg.once = false;

      roots.clear();
      for (int i = 0; i<int(numRootSliderval/(width/10)); i++) {
        roots.add(new root());
        roots.get(i).speed = speedSliderval/(width/10);
      }
    } else {
      stroke(R, G, B);
      fill(R, G, B);
      textSize(130);
      text("Play", width/2, height/2+height/8);
    }
    if (mousePressed && mouseY > height/2 + height/4 - height/40 &&  mouseY < height/2 + height/4 + height/40) {
      numRootSliderval = mouseX;
    }
    textSize(50);
    fill(fillCol);
    rect(width/2, height/2+height/4, width, height/20);
    fill(strokeCol);
    rect(numRootSliderval, height/2+height/4, 10, height/20);
  
    text("Amount Of Plants - " + int(numRootSliderval/(width/10)), width/2, height/2+height/5);
    
    
        if (mousePressed && mouseY > height/2 + height/3 + height/20 - height/40 &&  mouseY < height/2 + height/3+ height/20 + height/40) {
      speedSliderval = mouseX;
    }
    textSize(50);
    fill(fillCol);
    rect(width/2, height/2+height/3+ height/20, width, height/20);
    fill(strokeCol);
    rect(speedSliderval, height/2+height/3 + height/20, 10, height/20);
  
    text("Speed - " + (speedSliderval/(width/10)), width/2, height/2+height/3);
  }







  void fade() {
    if (dir) {
      R += random(0, random(4));
      G += random(0, random(4));
      B += random(0, random(4));
    }
    if (dir == false) {
      R -= random(0, random(4));
      G -= random(0, random(4));
      B -= random(0, random(4));
    } 

    if (R > 255 || G > 255 || B > 255) {
      dir = !dir;
    }

    if (R < 0 || G < 0 || B < 0) {
      dir = !dir;
    }

    background(R, G, B);
    fillCol = color(255-R, 255-G, 255-B);
    strokeCol = color(abs(205-R), abs(205-G), abs(205-B));

    fill(fillCol);
    stroke(strokeCol);
  }


  boolean button(int x, int y, int w, int h) {

    if (mouseX < x + w/2 && mouseX > x - w/2 && mouseY < y+h/2 && mouseY > y-h/2) {
      fill(abs(190-R), abs(190-G), abs(190-B));
      rect(x, y, w, h);
      return mousePressed;
    }
    rect(x, y, w, h);
    return false;
  }
}
