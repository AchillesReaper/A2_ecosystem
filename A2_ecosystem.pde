void setup() {
  // size(1600, 1000);
  fullScreen();
  frameRate(20);
  //load images
  img_sun = loadImage("image/sun/sun_1.png");
  img_cloud1 = loadImage("image/cloud/cloud_6.png");
  img_star1 = loadImage("image/background/star_1.png");
  img_building11_day = loadImage("image/background/building11_day_.png");
  img_building11_night = loadImage("image/background/building11_night_.png");
  img_rock = loadImage("image/background/rock.png");

  //for sun movement along the x-axis
  sunXincrement = (width-sunSize)/((sunsetTime-sunRaiseTime)*12); //The data shows 12 readings per hour
  

  //Rain effect
  for (int i=0; i< drops.length; i++) {
    drops[i] = new Drop();
  }
  rainSound = new SoundFile(this, "mixkit-light-rain-loop.wav");
  rainSound.loop();


  //load the data
  jsonData = loadJSONArray(dataLink);
  itemJson = 0;

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
  cp5.addButton("btn2021_07")
    .setLabel("2021-07")
    .setSize(60,30)
    .setPosition(20, height-120)
    ;

  cp5.addButton("btn2021_08")
    .setLabel("2021-08")
    .setSize(60,30)
    .setPosition(100, height-120)
    ;

  cp5.addButton("btn2021_09")
    .setLabel("2021-09")
    .setSize(60,30)
    .setPosition(180, height-120)
    ;

  cp5.addButton("btn2021_10")
    .setLabel("2021-10")
    .setSize(60,30)
    .setPosition(260, height-120)
    ;

  cp5.addButton("btn2021_11")
    .setLabel("2021-11")
    .setSize(60,30)
    .setPosition(340, height-120)
    ;
    
  cp5.addButton("btn2021_12")
    .setLabel("2021-12")
    .setSize(60,30)
    .setPosition(420, height-120)
    ;
    
  cp5.addButton("btn2022_01")
    .setLabel("2022-01")
    .setSize(60,30)
    .setPosition(20, height-80)
    ;

  cp5.addButton("btn2022_02")
    .setLabel("2022-02")
    .setSize(60,30)
    .setPosition(100, height-80)
    ;

  cp5.addButton("btn2022_03")
    .setLabel("2022-03")
    .setSize(60,30)
    .setPosition(180, height-80)
    ;

  cp5.addButton("btn2022_04")
    .setLabel("2022-04")
    .setSize(60,30)
    .setPosition(260, height-80)
    ;

  cp5.addButton("btn2022_05")
    .setLabel("2022-05")
    .setSize(60,30)
    .setPosition(340, height-80)
    ;
    
  cp5.addButton("btn2022_06")
    .setLabel("2022-06")
    .setSize(60,30)
    .setPosition(420, height-80)
    ;
    
  cp5.addButton("btn2022_07")
    .setLabel("2022-07_RMA")
    .setSize(60,30)
    .setPosition(500, height-80)
    ;
        


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

 //background
  image(img_rock,-40,height/2,width/6,height/3);
  if (!(currentTime >= sunRaiseTime && currentTime <= sunsetTime) && solar == 0) {
    image(img_building11_night,width-400,(height-200)-295,400,300);
  } else {
    image(img_building11_day,width-400,(height-200)-295,400,300);
  }
  //----------------------------------

  // cat
  pushMatrix();
  cat1(catPosition, height-200-size*12);
  popMatrix();
  catPosition += 1;

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
  bgm.amp(bgmAmp);
}
