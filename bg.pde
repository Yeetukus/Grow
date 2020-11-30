class bg {
  float R = 17;
  float G = 237;
  float B = 245;
  boolean fading = false;
  int lastTime = millis();
  boolean once = false;
  void render() {
    if (get(1, 1) == -1) {
      if (once == false) {
        lastTime = millis();
        once = true;
      }
      if ( millis() - lastTime > 1000 ) {
        lastTime = millis();
        menu = true;
        once = false;
      }
    }

    background(R, G, B);



    stroke(abs(255 - R), abs(255 - G), abs(255 - B));

    if (wallloc < width/2-width/6) {
      wallloc += 0.5;
    }
    G -= speed;
    R -= speed*2;
    if (G < 10) {
      B -= speed;
    }
    line(wallloc, 0, wallloc, height);
    line(width-wallloc, 0, width-wallloc, height);


    if (delay>30 || fading == true) {
      R += random(3, 8.5);
      B += random(1, 8.5);
      G += random(1, 8.5);
      delay--;
      fading = true;
      for (root part : roots) {
        part.slope = 0;
      }

      if (get(width/2, height/2) == 1) {
      }
    } else {
      fading = false;
    }
  }
}
