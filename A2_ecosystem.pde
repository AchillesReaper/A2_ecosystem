void setup() {
  size(1600, 1000);
  frameRate(20);
  //for sun movement along the x-axis
  sunXincrement = (width-sunSize)/((sunsetTime-sunRaiseTime)*12); //The data shows 12 readings per hour
  img_sun = loadImage("image/sun/sun_1.png");

  //Rain effect
  for (int i=0; i< drops.length; i++) {
    drops[i] = new Drop();
  }
  rainSound = new SoundFile(this, "mixkit-light-rain-loop.wav");
  rainSound.loop();

  //Cloud
  img_cloud1 = loadImage("image/cloud/cloud_6.png");

  //night background
  img_star1 = loadImage("image/staryNight/star_1.png");

  //load the data
  jsonData = loadJSONArray(dataLink);

  //Contorl elements
  cp5 = new ControlP5(this);


  cp5.addSlider("timeFlow")
    .setLabel("Time Flow Speed")
    .setSize(width/3, 30)
    .setValue(20)
    .setRange(5, 100)
    .setColorForeground(color(245, 255, 250))
    .setColorBackground(color(119, 136, 153))
    .setColorActive(color(245, 255, 250))
    .setPosition(20, height-180)
    ;

  //calendar btnS
  //turbine color knob
  cp5.addKnob("sldTColor")
    .setLabel("Turbine color")
    .setRange(0, 100)
    .setValue(20)
    .setRadius(80)
    .setPosition(width/2-80, height-180);

  //play btn
  cp5.addButton("btnBGM")
    .setLabel("BGM")
    .setSize(80,30)
    .setSwitch(true)
    .setPosition(width/2+160, height-180)
    ;

  //sound slider
  cp5.addSlider("bgmAmp")
    .setLabel("BGM volume")
    .setSize(180, 30)
    .setValue(0.2)
    .setRange(0.0, 1.0)
    .setColorForeground(color(245, 255, 250))
    .setColorBackground(color(119, 136, 153))
    .setColorActive(color(245, 255, 250))
    .setPosition(width/2+260, height-180)
    ;
  //sun height slider
  cp5.addSlider("sunHeight")
    .setLabel("Sun Height")
    .setSize(30, 160)
    .setValue(300)
    .setRange(250, 540)
    .setColorForeground(color(240, 128, 128))
    .setColorBackground(color(255, 160, 122))
    .setColorActive(color(240, 128, 128))
    .setPosition(width - 100, height - 180)
    ;
  //----------------------------------


  //background music
  bgm = new SoundFile(this, "Animal Crossing New Horizons.wav");
}

void draw() {
  background(r + 11, g + 16, b + 38);

  //read data
  String textDate = jsonData.getJSONArray(itemJson).getString(0);
  float rainDrop = jsonData.getJSONArray(itemJson).getFloat(1);
  float windSpeed = jsonData.getJSONArray(itemJson).getFloat(2);
  float solar = jsonData.getJSONArray(itemJson).getFloat(3);
  //----------------------------------


  //Night time sky or Day time -> visualise Solar Radiation
  if (!(currentTime >= sunRaiseTime && currentTime <= sunsetTime) && solar == 0) {
    nightSky();
  } else {
    solarRadiation(solar);
  }
  //----------------------------------


  //draw sun to visualise time -> visualise Time
  pushMatrix();
  translate(0, height/3*2);
  noStroke();
  drawSun(textDate);
  popMatrix();
  //----------------------------------


  //draw cloud + turbine -> visualise Wind
  cloud(windSpeed, height/5);

  turbineAngle += windSpeed*5;
  turbine(-turbineAngle);
  //----------------------------------


  //draw RainDrop -> visualise + audiolise Rain
  for (int xx=0; xx< rainDrop*10; xx++) {
    drops[xx].fall();
    drops[xx].show();
  }
  float rainVolume = map(rainDrop, 0, 120, 0.0, 1.0);
  rainSound.amp(rainVolume);
  //----------------------------------

  //Label -> showing sensors reading directly
  fill(255);
  textSize(20);
  text("Environment around Building 11 UTS", 20, 20);
  text("Time: ", 20, 50);
  text("Radiation: ", 20, 80);
  text("Wind: ", 20, 110);
  text("Rain: ", 20, 140);
  text(textDate, 120, 50);
  text(solar, 120, 80);
  text(windSpeed, 120, 110);
  text(rainDrop, 120, 140);
  //----------------------------------

  //ground
  fill(0);
  rect(0,height-200,width,200);


  //prepare JSON reading for the next loop
  if (itemJson < jsonData.size()-1) {
    itemJson++;
  } else {
    itemJson = 0;
  }
  //----------------------------------


  //control elements
  frameRate(timeFlow);
  bgm.amp(bgmAmp);
}
