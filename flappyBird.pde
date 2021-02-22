int var = 0; //store a variable that i can use to test things
int vel = 10; //store the variable to controll velocity
int gravity = 300; //store the variable to controll gravity
int horizontalLocation = 100;
int rectWidth = 50; //store the width of each obsticle(rectangle)
int rectHeight = 250; // store the height of each obsticle(rectangle)
int dead = 0;  //make the bird alive

void setup(){
 size(800,495); //size of window
}

void draw(){
  background(255);
  fill(0, 0, 0);
 
  //----------------------------------------------------------------------------------------
  //gravity and velocity
  if(gravity < 490){//give the bird gravity all of the time
  gravity = gravity + 2;
  }
  if(vel<800 && dead == 0){ //make the bird move foward only if the bird is alive
    vel =vel +1;
  }
  
  //--------------------------------------------------------------------------------------
  //collision logic
  
  //ground and roof collision logic
  if (gravity > 488){
   dead = dead + 1;
  }
  if(gravity ==0){
  dead = dead + 1;
}
  //other collision logic
 
 //collision logic for bottom rectangle 
 if(vel > horizontalLocation &&vel < horizontalLocation+rectWidth && gravity > 400){
   dead ++;
 }
 //collision logic for top rectangle
  if(vel > horizontalLocation && vel < horizontalLocation + rectWidth && gravity < 250){
   dead ++;
 }

  
//------------------------------------------------------------------------------------------
  
  //draw obsticles
  fill(0,255,0);//fill the obsticle green
  rect(horizontalLocation, 0, rectWidth, rectHeight);//first top obsticle
  rect(horizontalLocation, 400, rectWidth, rectHeight);//first bottom obsticle
  
  
  //-------------------------------------------------------------------------------------
  fill(0,255,0);//make the ground green
  rect(0,490,800,10);//draw the ground
  
  
  //-----------------------------------------------------------------------------------------
  //death physics
  if (dead > 0){//if the bird is dead then
  fill(255, 0, 0);//makethe bird red
  ellipse(vel,gravity,10,10);//and draw the bird
  } else{ // if the bird is alive then
  fill(255,255,0); //make the bird yellow
  ellipse(vel,gravity,10,10);//and draw the bird
  }
}

//-------------------------------------------------------------------------------------------------

void keyPressed() {//check if a key is pressed
  if (gravity > 0 && dead == 0){
  gravity = gravity -10;//move bird up
  }
}
