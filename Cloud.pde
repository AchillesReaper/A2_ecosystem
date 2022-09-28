PImage img_cloud1;

float x_start = -1*width;
float x_start2 = -1*width;

float cloud_spd = 1;
float cloud_spd2 = 13;

void cloud(float cloudSpeed,  float yPos) {
  image(img_cloud1, x_start, yPos, width/4, height/3);
  x_start+=cloudSpeed/3;
  if (x_start>=width) {
    x_start = width*-1;
  }
  
}
