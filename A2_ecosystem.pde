import processing.sound.*;
SoundFile soundfile;

JSONArray jsonData;
int itemJson = 0;

String dataLink = "data_2022-07_R.json";


int r = 0;
int g = 0;
int b = 0;

void setup() {
  size(1600, 1200);
  //frameRate(1200);
  //for sun movement along the x-axis
  sunXincrement = (width-sunSize)/((sunsetTime-sunRaiseTime)*12); //The data shows 12 readings per hour
  img_sun = loadImage("image/sun/sun_1.png");

  //Rain effect
  for (int i=0; i< drops.length; i++) {
    drops[i] = new Drop();
  }
  soundfile = new SoundFile(this, "mixkit-light-rain-loop.wav");
  soundfile.loop();

  //Cloud
  img_cloud1 = loadImage("image/cloud/cloud_6.png");

  
  //night background
  img_star1 = loadImage("image/staryNight/star_1.png");

  //load the data
  jsonData = loadJSONArray(dataLink);
}

void draw() {
  // visualise radiation
  float solar = jsonData.getJSONArray(itemJson).getFloat(3);
  background(r + 11, g + 16, b + 38);
  r = int(solar*10) + 50;
  g = int(solar*5);
  b =38;

  for(int i = 0; i < height;i++){
  stroke(r, i, i);
  line(0, i, width, i);
  }


  //Night time sky
  nightSky();


  //draw sun
  String textDate = jsonData.getJSONArray(itemJson).getString(0);
  String time = split(textDate, " ")[1];
  currentTime = int(split(time, ":")[0]);
  pushMatrix();
  translate(0, height/3*2);
  noStroke();
  drawSun();
  popMatrix();
  //----------------------------------


  //draw cloud
  float cloudSpeed = jsonData.getJSONArray(itemJson).getFloat(2);
  cloud(cloudSpeed,height/5);


  //draw RainDrop
  float rainDrop = jsonData.getJSONArray(itemJson).getFloat(1);
  for (int xx=0; xx< rainDrop; xx++) {
    drops[xx].fall();
    drops[xx].show();
  }
  float rainVolume = map(rainDrop, 0, 120, 0.0, 1.0);
  soundfile.amp(rainVolume);


  //Label
  fill(255);
  textSize(20);
  text("Environment around Building 11 UTS", 20, 20);
  text("Time: ", 20, 50);
  text("Radiation: ", 20, 80);
  text("Wind: ", 20, 110);
  text("Rain: ", 20, 140);
  text(textDate, 120, 50);
  text(solar, 120, 80);
  text(cloudSpeed, 120, 110);
  text(rainDrop, 120, 140);
  


  //prepare JSON reading for the next loop
  if (itemJson < jsonData.size()-1) {
    itemJson++;
  } else {
    itemJson = 0;
  }
}
