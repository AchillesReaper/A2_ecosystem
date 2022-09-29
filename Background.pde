PImage img_star1;
PImage img_building11_day;
PImage img_building11_night;
PImage img_rock;

void nightSky(){
    image(img_star1, 0,0, width, height/2);
    
}

void solarRadiation(float solar) {
  // background(r + 11, g + 16, b + 38);
  r = int(solar*10) + 50;
  g = int(solar*5);
  b =38;

  for (int i = 0; i < height; i++) {
    stroke(r, i, i);
    line(0, i, width, i);
  }

}
