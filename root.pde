class root {


  PVector loc = new PVector(width/2, height/2);
  float speed = 10;
    float slope = random(-speed, speed);
  ArrayList<PVector> locs = new ArrayList<PVector>();
  int num = 8;
  void render() {

    if (slope == 0) {
      slope = random(-speed, speed);
    }
    loc.x += slope;
    if(num > 5){
      num--;
    locs.add(loc);
    }
  num++;
    if (locs.get(locs.size()-1).x > width-wallloc || locs.get(locs.size()-1).x < wallloc) {
      menu = true;
    }


    for (int i = 0; i<locs.size()-1; i++) {
      locs.set(i, new PVector(locs.get(i).x, locs.get(i).y + speed));


      line(locs.get(i).x, locs.get(i).y,locs.get(i+1).x, locs.get(i+1).y);
      if (locs.get(i).x <wallloc || locs.get(i).x > width-wallloc || locs.get(i).y > height) {
        locs.remove(i);
      }
    }
    speed += 0.0005;
    slope = slope * 1.005;
  }
}
