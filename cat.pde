float count = 0; //counter for mouth
float count_leg = 0; //counter for leg
float size = 5;
//color cat_color = color(255,255,255);
int cat_color = color(255);
int catPosition =0;
boolean isPunk = false;

void cat1(float x_pos, float y_pos){
  noStroke();
  translate(x_pos, y_pos);
  front_leg();
  
  //fill cat color
  fill(cat_color);
  square(3*size,-6*size,size);
  square(-5*size,-6*size,size);
  square(-5*size,-5*size,size);
  square(2*size,-5*size,size);
  for (int i=-5;i<4;i++){
    square(i*size,-4*size,size);
  }
  for (int i=-6;i<5;i++){
    square(i*size,-3*size,size);
  }
    for (int i=-7;i<6;i++){
    square(i*size,-2*size,size);
  }
    for (int i=-7;i<6;i++){
    square(i*size,-1*size,size);
  }
    for (int i=-7;i<6;i++){
    square(i*size,0*size,size);
  }
    for (int i=-7;i<6;i++){
    square(i*size,1*size,size);
  }
    for (int i=-7;i<6;i++){
    square(i*size,2*size,size);
  }
    for (int i=-7;i<6;i++){
    square(i*size,3*size,size);
  }
    for (int i=-13;i<4;i++){
    square(i*size,5*size,size);
  }  
    for (int i=-13;i<4;i++){
    square(i*size,6*size,size);
  } 
    for (int i=-13;i<4;i++){
    square(i*size,7*size,size);
  } 
    for (int i=-13;i<4;i++){
    square(i*size,8*size,size);
  } 

  
  //mouth
  fill(0); 
  square(0*size,0*size,size);
  square(1*size,1*size,size);
  square(-1*size,1*size,size);
  
  //mouth movement
  if ((frameCount%40)==0){
    count = count+1;
  }
  if ((count<3)&&(count>1)){
    fill(#FC8F8F);
    square(0*size,1*size,size);
    square(0*size,2*size,size);
  }  
  if ((count>5)){
      count = 0;
  }
  println("mouth :",count);
  
  //eye
  fill(#4279EA); 
  square(-3*size,-1*size,size);
  square(-3*size,0*size,size);
  square(-4*size,1*size,size);
  square(-5*size,0*size,size);
  square(-5*size,-1*size,size);
    
    
  fill(0); 
  square(-4*size,0*size,size);
  square(-4*size,-1*size,size);

  fill(#4279EA); 
  square(2*size,0*size,size);
  square(4*size,0*size,size);
  square(4*size,-1*size,size);
  square(2*size,-1*size,size);
  square(3*size,1*size,size);
  square(2*size,0*size,size);
  
  fill(0); 
  square(3*size,0*size,size);
  square(3*size,-1*size,size);
  
  //face
  square(6*size,-1*size,size);
  square(6*size,0*size,size);
  square(6*size,1*size,size);
  square(6*size,2*size,size);
  square(7*size,0*size,size);
  square(7*size,2*size,size);
  square(5*size,3*size,size);
  square(4*size,4*size,size);
  square(4*size,4*size,size);
  square(-7*size,2*size,size);
  square(-8*size,2*size,size);
  square(-9*size,2*size,size);
  square(-8*size,1*size,size);
  square(-8*size,0*size,size);
  square(-7*size,0*size,size);
  square(-9*size,0*size,size);
  square(-8*size,-1*size,size);
  square(-8*size,-2*size,size);
  square(-7*size,-3*size,size);
  square(-7*size,-4*size,size);
  square(-6*size,-4*size,size);
  square(-6*size,-5*size,size);
  
  square(-6*size,-6*size,size);
  square(-5*size,-7*size,size);
  square(-4*size,-6*size,size);
  square(-3*size,-5*size,size);
  square(-2*size,-5*size,size);
  square(-1*size,-5*size,size);
  square(0*size,-5*size,size);
  square(1*size,-5*size,size);
  square(2*size,-6*size,size);
  square(3*size,-7*size,size);
  square(4*size,-6*size,size);
  square(4*size,-5*size,size);
  square(4*size,-4*size,size);
  square(5*size,-3*size,size);
  square(6*size,-2*size,size);
  
  fill(#F7BEBF);
  square(-4*size,-5*size,size);
  square(3*size,-5*size,size);
  //collar
  fill(#DB6F16);
  square(3*size,4*size,size);
  square(2*size,4*size,size);  
  square(1*size,4*size,size);
  square(0*size,4*size,size);
  square(-1*size,4*size,size);
  square(-2*size,4*size,size);
  square(-3*size,4*size,size);
  square(-4*size,4*size,size);
  square(-5*size,4*size,size);
  square(-6*size,3*size,size);


  //bell
  if (isPunk){
  fill(#FFB85A);
  square(0*size,-5*size,size);
  square(0*size,-4*size,size);
  square(1*size,-4*size,size);
  square(1*size,-5*size,size);
  square(0*size,-4*size,size);
  square(0*size,5*size,size);
  square(0*size,-6*size,size);
  square(1*size,-6*size,size);
  square(0*size,-7*size,size);
  fill(#FAD5A4);
  square(1*size,-5*size,size);
  square(-1*size,-5*size,size);
  square(-1*size,-6*size,size);
  square(-1*size,-4*size,size);
  square(0*size,-3*size,size);
  }

  //body
  fill(0);
  square(-7*size,3*size,size);
  square(-6*size,4*size,size);
  square(-7*size,4*size,size);
  square(-8*size,4*size,size);
  square(-9*size,4*size,size);
  square(-10*size,4*size,size);
  square(-11*size,4*size,size);
  square(-12*size,4*size,size);
  
  //tail
  fill(cat_color);
  square(-15*size,3*size,size);
  square(-14*size,3*size,size);
  square(-14*size,4*size,size);
  square(-13*size,4*size,size);
  square(-15*size,2*size,size);
  square(-16*size,2*size,size);
  square(-16*size,1*size,size);
  square(-15*size,1*size,size);
  square(-15*size,0*size,size);
  square(-14*size,0*size,size);
  square(-14*size,-1*size,size);
  square(-13*size,-1*size,size);
  square(-13*size,-2*size,size);
  square(-12*size,-2*size,size);
  square(-12*size,-3*size,size);
  
  fill(0);
  square(-13*size,3*size,size);
  square(-14*size,2*size,size);
  square(-14*size,1*size,size);
  square(-13*size,0*size,size);
  square(-12*size,-1*size,size);
  square(-11*size,-2*size,size);
  square(-11*size,-3*size,size);
  square(-12*size,-4*size,size);
  square(-13*size,-3*size,size);
  square(-14*size,-2*size,size);
  square(-15*size,-1*size,size);
  square(-16*size,0*size,size);
  square(-17*size,1*size,size);
  square(-17*size,2*size,size);
  square(-16*size,3*size,size);
  square(-15*size,4*size,size);
  square(-14*size,5*size,size);
  square(-13*size,6*size,size);
  square(-13*size,7*size,size);
  square(-13*size,8*size,size);
  
  square(4*size,5*size,size);
  square(4*size,6*size,size);
  square(4*size,7*size,size);
  
  //belly
  square(-4*size,10*size,size);
  square(-5*size,10*size,size);
  square(-6*size,10*size,size);
  square(-7*size,10*size,size);
  square(-8*size,10*size,size);

}
void front_leg(){
  
  //leg movement time
  if ((frameCount%2)==0){
    count_leg = count_leg+1;
  }
    if ((count_leg<3)&&(count_leg>-1)){
    fill(cat_color);
    square(4*size,9*size,size);
    square(3*size,10*size,size); 
    square(4*size,10*size,size);  
    square(3*size,9*size,size);
    square(2*size,9*size,size);
    fill(0);
    //front_leg1
    square(4*size,8*size,size);
    square(5*size,9*size,size);
    square(5*size,10*size,size);
    square(4*size,11*size,size);
    square(3*size,11*size,size);
    square(2*size,10*size,size);
    square(1*size,9*size,size);
  
    //front_leg2_backward
    fill(cat_color);
    square(-1*size,9*size,size);
    square(-2*size,9*size,size);
    square(-3*size,9*size,size);
    square(-3*size,10*size,size);
    square(-2*size,10*size,size);
    square(-5*size,9*size,size);
    square(-6*size,9*size,size);
    square(-7*size,9*size,size);
    square(-8*size,9*size,size);
    fill(0);
      
    square(0*size,9*size,size);
    square(-1*size,10*size,size);
    square(-2*size,11*size,size);
    square(-3*size,11*size,size);
    square(-4*size,10*size,size);
    square(-4*size,9*size,size);
    //back_leg1_forward
    fill(cat_color);      
    square(-10*size,9*size,size);
    square(-11*size,9*size,size);
    square(-12*size,9*size,size);
    square(-11*size,10*size,size);
    square(-10*size,10*size,size);
    fill(0);
    square(-9*size,9*size,size);
    square(-9*size,10*size,size);
    square(-10*size,11*size,size);
    square(-11*size,11*size,size);
    square(-12*size,10*size,size);
    square(-13*size,9*size,size);
    


  }
  
    if ((count_leg<6)&&(count_leg>2)){
    fill(cat_color); 
    square(3*size,9*size,size); 
    square(2*size,9*size,size); 
    square(1*size,9*size,size); 
    square(2*size,10*size,size);
    
    ////front_leg1_backward
    fill(0);
    square(4*size,8*size,size);
    square(4*size,9*size,size);
    square(3*size,10*size,size);
    square(2*size,11*size,size);
    square(1*size,11*size,size);
    
    fill(cat_color); 
    square(-1*size,9*size,size);
    square(-2*size,9*size,size); 
    square(-1*size,10*size,size); 
    square(0*size,10*size,size); 
    
    //front_leg2_forward 
    fill(0);
    square(0*size,9*size,size);
    square(1*size,10*size,size);
    square(0*size,11*size,size);
    square(-1*size,11*size,size);
    square(-2*size,10*size,size);
    square(-3*size,9*size,size);
    
    fill(cat_color); 
    square(-4*size,9*size,size);
    square(-5*size,9*size,size);
    square(-6*size,9*size,size);
    square(-7*size,9*size,size);
    square(-8*size,9*size,size);
    square(-9*size,9*size,size);
    
    square(-11*size,9*size,size);
    square(-12*size,9*size,size);
    square(-13*size,9*size,size);
    square(-12*size,10*size,size);
    square(-13*size,10*size,size);
    //back_leg1_backward
    fill(0);
    square(-10*size,9*size,size);
    square(-11*size,10*size,size);
    square(-12*size,11*size,size);
    square(-13*size,11*size,size);
    square(-14*size,10*size,size);
    square(-14*size,9*size,size);
    
    //back_leg2 
    square(-9*size,10*size,size);
    square(-8*size,11*size,size);
    square(-9*size,11*size,size);
    square(-10*size,10*size,size);
  }

  // reset value of leg count
  if ((count_leg>5)){
      count_leg = 0;
  }
  println("leg :",count_leg);

}