static final int EAST = 1;
static final int WEST = 0;

PImage character;
PImage characterIdle;

double idle;

PImage characterFlip;
PImage characterIdleFlip;

int direction;

PImage moveOne;
PImage moveTwo;
PImage moveThree;
PImage moveFour;
PImage moveFive;
PImage moveSix;
PImage moveSeven;
PImage moveEight;

PImage moveOneFlip;
PImage moveTwoFlip;
PImage moveThreeFlip;
PImage moveFourFlip;
PImage moveFiveFlip;
PImage moveSixFlip;
PImage moveSevenFlip;
PImage moveEightFlip;

PImage areaOne;

int xPos;
int yPos;

double currentRun;
int movementSpeed;

Controller keyboardInput;
PImage[] idleCycle;
PImage[] idleCycleFlipped;

PImage[] runCycle;
PImage[] runCycleFlip;

PImage[] location; 

void setup() {
  size(1100, 700);
  
  character = loadImage("character.png");
  character.resize(100, 0);
  
  characterIdle = loadImage("characteridle.png");
  characterIdle.resize(100, 0);
  
  characterFlip = loadImage("characterflipped.png");
  characterFlip.resize(100, 0);
  
  characterIdleFlip = loadImage("characteridleflipped.png");
  characterIdleFlip.resize(100, 0);
  
  idleCycle = new PImage[2];
  idleCycle[0] = character;
  idleCycle[1] = characterIdle;
  
  idleCycleFlipped = new PImage[2];
  idleCycleFlipped[0] = characterFlip;
  idleCycleFlipped[1] = characterIdleFlip;
  
  idle = 0;
  direction = EAST;
  
  moveOne = loadImage("charmoveone.png");
  moveOne.resize(100, 0);
  
  moveTwo = loadImage("charmovetwo.png");
  moveTwo.resize(100, 0);
  
  moveThree = loadImage("charmovethree.png");
  moveThree.resize(95, 0);
  
  moveFour = loadImage("charmovefour.png");
  moveFour.resize(100, 0);
  
  moveFive = loadImage("charmovefive.png");
  moveFive.resize(110, 0);
  
  moveSix = loadImage("charmovesix.png");
  moveSix.resize(100, 0);
  
  moveSeven = loadImage("charmoveseven.png");
  moveSeven.resize(100, 0);
  
  moveEight = loadImage("charmoveeight.png");
  moveEight.resize(100, 0);
    
  runCycle = new PImage[8];
  runCycle[0] = moveOne;
  runCycle[1] = moveTwo;
  runCycle[2] = moveThree;
  runCycle[3] = moveFour;
  runCycle[4] = moveFive;
  runCycle[5] = moveSix;
  runCycle[6] = moveSeven;
  runCycle[7] = moveEight;
  
  moveOneFlip = loadImage("charmoveoneflipped.png");
  moveOneFlip.resize(100, 0);
  
  moveTwoFlip = loadImage("charmovetwoflipped.png");
  moveTwoFlip.resize(100, 0);
  
  moveThreeFlip = loadImage("charmovethreeflipped.png");
  moveThreeFlip.resize(95, 0);
  
  moveFourFlip = loadImage("charmovefourflipped.png");
  moveFourFlip.resize(100, 0);
  
  moveFiveFlip = loadImage("charmovefiveflipped.png");
  moveFiveFlip.resize(110, 0);
  
  moveSixFlip = loadImage("charmovesixflipped.png");
  moveSixFlip.resize(100, 0);
  
  moveSevenFlip = loadImage("charmovesevenflipped.png");
  moveSevenFlip.resize(100, 0);
  
  moveEightFlip = loadImage("charmoveeightflipped.png");
  moveEightFlip.resize(100, 0);
  
  runCycleFlip = new PImage[8];
  runCycleFlip[0] = moveOneFlip;
  runCycleFlip[1] = moveTwoFlip;
  runCycleFlip[2] = moveThreeFlip;
  runCycleFlip[3] = moveFourFlip;
  runCycleFlip[4] = moveFiveFlip;
  runCycleFlip[5] = moveSixFlip;
  runCycleFlip[6] = moveSevenFlip;
  runCycleFlip[7] = moveEightFlip;
  
  areaOne = loadImage("areaone.png");
  areaOne.resize(1100, 700);

  
  location = new PImage[8];
  
  xPos = 450;
  yPos = 530;
  
  movementSpeed = 7;
  currentRun = 0;
  
  keyboardInput = new Controller();
  

}

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

//Visualize which keys are being held down...
void draw() {
  background(255);
  image(areaOne, 0, 0);
  
  if (direction == 1){
  image(idleCycle[(int)idle], xPos, yPos);
  }
  
  if (direction == 0){
  image(idleCycleFlipped[(int)idle], xPos, yPos);
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
  image(runCycleFlip[(int)currentRun], xPos, yPos);
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
  image(runCycle[(int)currentRun], xPos, yPos);
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
