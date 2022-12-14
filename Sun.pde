//variable for the sun
int sunSize = 100;
int sunHeight = 350;
int sunX = sunSize/2;
float sunY = 300;
int sunRaiseTime = 6;
int sunsetTime = 18;
int currentTime;
float sunRotateAngle = 0;
float sunXincrement;
PImage img_sun;
//________________________________

//variable for solar radiation
int r = 0;
int g = 0;
int b = 0;
//________________________________

void drawSun(String textDate) {
  String time = split(textDate, " ")[1];
  currentTime = int(split(time, ":")[0]);
  //x-coordinate of the sun
  if (currentTime >= sunRaiseTime && currentTime <= sunsetTime) {
    sunX += sunXincrement;
  } else {
    sunX = sunSize/2;
  }
  //y-coordinate of the sun
  float sunXt = map(sunX, sunSize/2, width-sunSize/2, -(width-sunSize)/2, (width-sunSize)/2);
  sunY = sunHeight/sq((width-sunSize)/2)*sq(sunXt) - sunHeight;
  fill(255, 0, 0);

  translate(sunX, sunY);
  rotate(sunRotateAngle);
  image(img_sun, -sunSize/2, -sunSize/2, sunSize, sunSize);
  sunRotateAngle += 0.05;
}
