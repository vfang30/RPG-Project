PImage character;

PImage moveOne;
PImage moveTwo;
PImage moveThree;
PImage moveFour;
PImage moveFive;
PImage moveSix;
PImage moveSeven;
PImage moveEight;

PImage areaOne;

int xPos;
int yPos;

double currentRun;
int movementSpeed;

Controller keyboardInput;
PImage[] runCycle;

PImage[] location;

void setup() {
  size(1100, 700);
  
  character = loadImage("character.png");
  character.resize(100, 0);
  
  moveOne = loadImage("charmoveone.png");
  moveOne.resize(100, 0);
  
  moveTwo = loadImage("charmovetwo.png");
  moveTwo.resize(100, 0);
  
  moveThree = loadImage("charmovethree.png");
  moveThree.resize(100, 0);
  
  moveFour = loadImage("charmovefour.png");
  moveFour.resize(100, 0);
  
  moveFive = loadImage("charmovefive.png");
  moveFive.resize(100, 0);
  
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
  
  areaOne = loadImage("areaone.png");
  areaOne.resize(1100, 700);

  
  location = new PImage[8];
  
  xPos = 450;
  yPos = 530;
  
  movementSpeed = 10;
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
  image(character, xPos, yPos);
  
  movement();
  
}

void movement(){
  
  
  if (keyboardInput.isPressed(Controller.MOVE_LEFT) && xPos > 0) {
  loadBackground();
  xPos = xPos - movementSpeed;
  
    if (currentRun > 7){
    currentRun = 0;
  }
  image(runCycle[(int)currentRun], xPos, yPos);
  currentRun +=.1;
  }

  if (keyboardInput.isPressed(Controller.MOVE_RIGHT) && xPos < 1000) {
  loadBackground();
  xPos = xPos + movementSpeed;
  
    if (currentRun > 7){
    currentRun = 0;
    }
  image(runCycle[(int)currentRun], xPos, yPos);
  currentRun +=.1;
  }
}

void loadBackground(){
  image(areaOne, 0, 0);
}
