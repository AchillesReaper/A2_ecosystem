PImage img_cloud1;

float x_start = width*1.25;


void cloud(float cloudSpeed,  float yPos) {
  image(img_cloud1, x_start, yPos, width/4, height/3);
  x_start-=cloudSpeed;
  if (x_start<=-width/4) {
    x_start = width*1.25;
  }
  
}
