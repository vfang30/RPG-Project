double idle;

PImage areaOne;

double currentRun;
int movementSpeed;

Player player;

Controller keyboardInput;

PImage[] location; 

void setup() {
  size(1100, 700);
  
  
  idle = 0;
  
  areaOne = loadImage("areaone.png");
  areaOne.resize(1100, 700);

  
  location = new PImage[8];
  
  movementSpeed = 7;
  currentRun = 0;
  
  player = new Player();
  keyboardInput = new Controller();
  

}

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

void draw() {
  background(255);
  image(areaOne, 0, 0);
  
  if (player.direction == 1){
  image(player.idleCycle[(int)idle], player.xPos, player.yPos);
  }
  
  if (player.direction == 0){
  image(player.idleCycleFlipped[(int)idle], player.xPos, player.yPos);
  }
  
  
  idle += 0.03;
  if ((int)idle > 1){
  idle = 0;
  }
  
  movement();
  
}

void movement(){
  
  boolean moved = false;
  
  if (keyboardInput.isPressed(Controller.MOVE_LEFT) && player.xPos > 0) {
    
  loadBackground();
  player.xPos = player.xPos - movementSpeed;
  player.direction = Player.WEST;
  
    if (currentRun > 7){
    currentRun = 0;
  }
  image(player.runCycleFlip[(int)currentRun], player.xPos, player.yPos);
  currentRun +=.05;
  
  moved = true;
  }

  if (keyboardInput.isPressed(Controller.MOVE_RIGHT) && player.xPos < 1000) {
    
  loadBackground();
  player.xPos = player.xPos + movementSpeed;
  player.direction = Player.EAST;
  
    if (currentRun > 7){
    currentRun = 0;
    }
  image(player.runCycle[(int)currentRun], player.xPos, player.yPos);
  currentRun +=.05;
  
  moved = true;
  }
  
  if (!moved){
    currentRun = 0;
  }
}

void loadBackground(){
  image(areaOne, 0, 0);
}
