import processing.sound.*;
import controlP5.*;


ControlP5 cp5;
int timeFlow;
int sldTColor;
float bgmAmp;

SoundFile rainSound;
SoundFile bgm;

JSONArray jsonData;
int itemJson;

String dataLink = "data/json/data_2022-07_R.json";

public void btnBGM(boolean theValue){
    if (theValue){
        bgm.loop();
    }else{
        bgm.stop();
    }
}

public void btn2021_07(){
    dataLink = "data/json/data_2021-07.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2021_08(){
    dataLink = "data/json/data_2021-08.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2021_09(){
    dataLink = "data/json/data_2021-09.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2021_10(){
    dataLink = "data/json/data_2021-10.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2021_11(){
    dataLink = "data/json/data_2021-11.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2021_12(){
    dataLink = "data/json/data_2021-12.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2022_01(){
    dataLink = "data/json/data_2022-01.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2022_02(){
    dataLink = "data/json/data_2022-02.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2022_03(){
    dataLink = "data/json/data_2022-03.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2022_04(){
    dataLink = "data/json/data_2022-04.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2022_05(){
    dataLink = "data/json/data_2022-05.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2022_06(){
    dataLink = "data/json/data_2022-06.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
public void btn2022_07(){
    dataLink = "data/json/data_2022-07_RMA.json";
    jsonData = loadJSONArray(dataLink);
    itemJson = 0;
}
