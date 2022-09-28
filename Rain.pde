Drop [] drops = new Drop[500];

class Drop {
  float x = random(width) ;
  float y = random(-1500, -100);
  //float yspeed = random(4,10) ;
  float z = random(20);
  float len = map(z, 0, 20, 10, 20); //len of the rain drop, map between 10 ~ 20
  //float len = random(1,20);
  float yspeed = map(z, 0, 20, 4, 10) ; // Dropping speed

  void fall() {
    y = y + yspeed;
    yspeed = yspeed + 0.5;


    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() {
    float thick = map(z, 0, 20, 0.1, 0.3);
    strokeWeight (thick);
    stroke(0,0,255); // white color rain drop
    line(x, y, x, y +len);
  }
}
