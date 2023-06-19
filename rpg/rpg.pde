double idle; //idle state 
float gravity = .8; 
float velocityDown = 0; 
float velocityUp = 20;

boolean jump; 
double currentJump; //jump state

PImage areaOne;
PImage areaZero;

double currentRun; //run state
int movementSpeed;

Player player;

Controller keyboardInput;

PImage[] location; //plan to use this to store diffeentt locations in the game

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}


void setup() {
  size(1100, 700);
  
  idle = 0;
  
  areaOne = loadImage("areaone.png");
  areaOne.resize(1100, 700);
  
  areaZero = loadImage("areazero.png");
  areaZero.resize(1100, 700);

  
  movementSpeed = 7;
  currentRun = 0;
  
  player = new Player();
  keyboardInput = new Controller();
  
  jump = false;
  currentJump = 0;
  

}

void draw() {
  background(255);
  image(areaZero, 0, 0);
  
  playerDraw();
  movement();
  
  //while in jump player goes up by velocity (velocity pulled down by gravity)
  if (jump){
    velocityDown = 0;
    velocityUp = velocityUp - gravity;
    player.yPos = player.yPos - velocityUp;

    if (velocityUp <= 0){ //stop jump state when velocity stops
      jump = false;
    }
    
  }
  
  //fall
  if (!jump && player.yPos < 490){
    //reset upward velocity and jump cycle in preparation for next jump
    velocityUp = 20;
    currentJump = 0;
    
    //go down
    velocityDown = velocityDown + gravity;
    player.yPos = player.yPos + velocityDown;
  }
  
  //update the idle stance
  idle += 0.03;
  if ((int)idle > 1){
  idle = 0;
  }
  
}

void playerDraw(){
  
   loadBackground();
  
  if (jump){
    
    jump();
    
  }
  
  //load the right idle cycle when not jumping
  if (player.direction == Player.EAST && !jump){
   image(player.idleCycle[(int)idle], player.xPos, player.yPos);
  }
  
  //load the left idle cycle when not jumping
  if (player.direction == Player.WEST && !jump){
  image(player.idleCycleFlipped[(int)idle], player.xPos, player.yPos);
  }
  
}

void jump(){

  if (currentJump < 7 && currentJump > 2){
   currentJump += 0.2;
  }
   
   //made it faster at the start because the first few sprites have the characters legs being kicked off the ground and i wanted to time it better
  if (currentJump < 2){
   currentJump += .8;
  }
    
  //load right jump cycle
  if (player.direction == Player.EAST){
   image(player.jumpCycle[(int)currentJump], player.xPos, player.yPos);
   }
   
  //load left jump cycle
  if (player.direction == Player.WEST){
   image(player.jumpCycleFlipped[(int)currentJump], player.xPos,  player.yPos);
   }
}

void movement(){
  
  //check if the player made a movement
  boolean moved = false;
  
  boolean left = keyboardInput.isPressed(Controller.MOVE_LEFT);
  boolean right = keyboardInput.isPressed(Controller.MOVE_RIGHT);


  if (left && player.xPos > 40) {
    
  loadBackground();
  player.xPos = player.xPos - movementSpeed; //shift the player's x coord to the left
  player.direction = Player.WEST; //change the direction to west for the idle cycle
  
  image(player.runCycleFlipped[(int)currentRun], player.xPos, player.yPos);
  currentRun +=.05;
  
  //reset run cycle
  if (currentRun > 7){
    currentRun = 0;
  }
  
  moved = true;
  }

  if (right && player.xPos < 1000) {
    
  loadBackground();
  player.xPos = player.xPos + movementSpeed; //shift the player's x coord to the right
  player.direction = Player.EAST; //change the direction to east for the idle cycle
  
  image(player.runCycle[(int)currentRun], player.xPos, player.yPos);
  currentRun +=.05;
  
    //reset run cycle
   if (currentRun > 7){
    currentRun = 0;
   }
  
  moved = true;
  }
  
   //if the player did not make a movement/stopped reset run cycle
  if (!moved){
    currentRun = 0;
  }
}

//for now its just areaZero, will likely take in a paramater and load a background accordingly
void loadBackground(){
  image(areaZero, 0, 0);
}

//this is for loading the images
String[] listFileNames(String dir){
  File file = new File(dir);
  if (file.isDirectory()){
    String names[] = file.list();
    return names;
  }else{
  return null;
  }
}
