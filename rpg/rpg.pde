static final int EAST = 1;
static final int WEST = 0;


double idle;
int direction;

PImage areaOne;

int xPos;
int yPos;

double currentRun;
int movementSpeed;

Player player;

Controller keyboardInput;
PImage[] idleCycle;
PImage[] idleCycleFlipped;

PImage[] runCycle;
PImage[] runCycleFlip;

PImage[] location; 

void setup() {
  size(1100, 700);
  
  
  idle = 0;
  direction = EAST;
  
  areaOne = loadImage("areaone.png");
  areaOne.resize(1100, 700);

  
  location = new PImage[8];
  
  xPos = 450;
  yPos = 530;
  
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
  
  if (direction == 1){
  image(player.idleCycle[(int)idle], xPos, yPos);
  }
  
  if (direction == 0){
  image(player.idleCycleFlipped[(int)idle], xPos, yPos);
  }
  
  
  idle += 0.03;
  if ((int)idle > 1){
  idle = 0;
  }
  
  movement();
  
}

void movement(){
  
  boolean moved = false;
  
  if (keyboardInput.isPressed(Controller.MOVE_LEFT) && xPos > 0) {
    
  loadBackground();
  xPos = xPos - movementSpeed;
  direction = WEST;
  
    if (currentRun > 7){
    currentRun = 0;
  }
  image(player.runCycleFlip[(int)currentRun], xPos, yPos);
  currentRun +=.05;
  
  moved = true;
  }

  if (keyboardInput.isPressed(Controller.MOVE_RIGHT) && xPos < 1000) {
    
  loadBackground();
  xPos = xPos + movementSpeed;
  direction = EAST;
  
    if (currentRun > 7){
    currentRun = 0;
    }
  image(player.runCycle[(int)currentRun], xPos, yPos);
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
