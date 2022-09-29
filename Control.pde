import processing.sound.*;
import controlP5.*;


ControlP5 cp5;
int timeFlow;
int sldTColor;
float bgmAmp;

SoundFile rainSound;
SoundFile bgm;


JSONArray jsonData;
int itemJson = 0;

String dataLink = "data_2022-07_R.json";

public void btnBGM(boolean theValue){
    if (theValue){
        bgm.loop();
    }else{
        bgm.stop();
    }
}