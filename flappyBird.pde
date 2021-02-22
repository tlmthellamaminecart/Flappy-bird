int var = 0; //store a variable that i can use to test things
int vel = 10; //store the variable to controll velocity
int gravity = 300; //store the variable to controll gravity
int horizontalLocation = 100;//you get it it is the horizonbtal location of the pipe 
int rectWidth = 50; //store the width of each obsticle(rectangle/pipe)
int rectHeight = 250; // store the height of each obsticle(rectangle/pipe)
int dead = 0;  //make the bird alive
//-----------------------------------
//locations
int secondLocation = 250; // change this to adjust how close the second pipe is to the first 
int thirdLocation= 400;//change this to adjust how close this is to the second and fourth pipe 
//----------------------------------
//places
int second = 150;// make sure that this and is the distance between the first and second pipe
int third = 300;//make sure that this and is the distance between the first and third pipe

void setup(){
 size(800,495); //size of window
}

void draw(){
  
  //----------------------------------------------------------------------------------
  background(255);
  fill(0, 0, 0);
 
  //----------------------------------------------------------------------------------------
  //gravity and velocity
  if(gravity < 490 && dead == 0){//give the bird gravity all of the time that it is alive
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
 
 //collision logic for bottom rectangle 1
 if(vel > horizontalLocation &&vel < horizontalLocation+rectWidth && gravity > 400){
   dead ++;
 }
 //collision logic for top rectangle 1
  if(vel > horizontalLocation && vel < horizontalLocation + rectWidth && gravity < 250){
   dead ++;
 }
 //collision logic for bottom rectangle 2
 if(vel > horizontalLocation + second && vel < horizontalLocation + second + rectWidth && gravity > 400){
   dead ++;
 }
 //collision logic for top rectangle 2
  if(vel > horizontalLocation + second && vel < horizontalLocation + second + rectWidth && gravity < 250){
   dead ++;
 }
 //collision logic for bottom rectangle 3
 if(vel > horizontalLocation + third && vel < horizontalLocation + third + rectWidth && gravity > 400){
   dead ++;
 }
 //collision logic for top rectangle 3
  if(vel > horizontalLocation + third && vel < horizontalLocation + third + rectWidth && gravity < 250){
   dead ++;
 }
  
//------------------------------------------------------------------------------------------
  
  //draw obsticles
  fill(0,255,0);//fill the obsticle green
  //first pipe pair
  rect(horizontalLocation, 0, rectWidth, rectHeight);//first top obsticle
  rect(horizontalLocation, 400, rectWidth, rectHeight);//first bottom obsticle
  // second pipe pair
  rect(secondLocation, 0, rectWidth, rectHeight);//second top obsticle
  rect(secondLocation, 400, rectWidth, rectHeight);//second bottom obsticle
  //third pipe pair
  rect(thirdLocation, 0, rectWidth, rectHeight);// top obsticle
  rect(thirdLocation, 400, rectWidth, rectHeight);// bottom obsticle
  
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
