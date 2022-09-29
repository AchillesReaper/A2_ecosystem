float turbineAngle = 0;
void turbine(float rotateSpeed){
    triangle(width/2, height/2, width/2-10, height, width/2+10, height);

    pushMatrix();
    translate(width/2, height/2);

    rotate(rotateSpeed*radians(1));
    translate(-width/2, -height/2);
    fill(sldTColor*2,sldTColor/3,sldTColor); //@TODO formular for the color to be adjusted
    tri(TWO_PI/3);
    tri(TWO_PI/3*2);
    tri(TWO_PI/3*3);
    popMatrix();
}

void tri(float rot_Val) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(rot_Val);
    translate(-30, -30);
    triangle(-30, 30, -10, -100, 25, 30);
    popMatrix();
}

