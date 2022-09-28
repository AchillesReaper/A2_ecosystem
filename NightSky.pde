PImage img_star1;

void nightSky(){
    if (!(currentTime >= sunRaiseTime && currentTime <= sunsetTime)) {
    image(img_star1, 0,0, width, height/2);
    }
}