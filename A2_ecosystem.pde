import processing.sound.*;

JSONArray jsonData;
int itemJson = 0;

String dataLink = "data_2022-07_R.json";


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
  soundfile = new SoundFile(this, "mixkit-light-rain-loop.wav");
  soundfile.loop();

  //Cloud
  img_cloud1 = loadImage("image/cloud/cloud_6.png");

  //night background
  img_star1 = loadImage("image/staryNight/star_1.png");

  //load the data
  jsonData = loadJSONArray(dataLink);

  //Contorl elements
  cp5 = new ControlP5(this);

  cp5.addSlider("sunHeight")
    .setLabel("Sun Height")
    .setPosition(width - 100, height - 150)
    .setSize(40, 100)
    .setValue(300)
    .setRange(250, 540)
    .setColorForeground(color(240, 128, 128))
    .setColorBackground(color(255, 160, 122))
    .setColorActive(color(240, 128, 128))
    ;

  cp5.addSlider("timeFlow")
    .setLabel("Time Flow Speed")
    .setPosition(width/2, height - 100)
    .setSize(100, 40)
    .setValue(20)
    .setRange(5, 60)
    .setColorForeground(color(245, 255, 250))
    .setColorBackground(color(119, 136, 153))
    .setColorActive(color(245, 255, 250))
    ;
  //----------------------------------


  //background music
  // ac = new AudioContext();
  // String audioFileName = "data/Animal Crossing New Horizons.wav";
  // player = new SamplePlayer(ac, SampleManager.sample(audioFileName));
  
  // player.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  // p = new Panner(ac, 0);
  // gg = new Gain(ac, 2, 0.5);
  // p.addInput(player);
  // gg.addInput(p);
  // ac.out.addInput(gg);
  // ac.start();
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
  soundfile.amp(rainVolume);
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


  //prepare JSON reading for the next loop
  if (itemJson < jsonData.size()-1) {
    itemJson++;
  } else {
    itemJson = 0;
  }
  //----------------------------------


  //control elements
  frameRate(timeFlow);
}
