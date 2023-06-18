PImage character;

PImage moveOne;
PImage moveTwo;
PImage moveThree;
PImage moveFour;
PImage moveFive;
PImage moveSix;
PImage moveSeven;
PImage moveEight;

int xPos;
int yPos;

double currentRun;
int movementSpeed;
int delay;

Controller keyboardInput;
PImage[] runCycle;

void setup() {
  size(900, 900);
  
  character = loadImage("character.png");
  character.resize(80, 0);
  
  moveOne = loadImage("charmoveone.png");
  moveOne.resize(80, 0);
  
  moveTwo = loadImage("charmovetwo.png");
  moveTwo.resize(80, 0);
  
  moveThree = loadImage("charmovethree.png");
  moveThree.resize(80, 0);
  
  moveFour = loadImage("charmovefour.png");
  moveFour.resize(80, 0);
  
  moveFive = loadImage("charmovefive.png");
  moveFive.resize(80, 0);
  
  moveSix = loadImage("charmovesix.png");
  moveSix.resize(80, 0);
  
  moveSeven = loadImage("charmoveseven.png");
  moveSeven.resize(80, 0);
  
  moveEight = loadImage("charmoveeight.png");
  moveEight.resize(80, 0);
  
  runCycle = new PImage[8];
  runCycle[0] = moveOne;
  runCycle[1] = moveTwo;
  runCycle[2] = moveThree;
  runCycle[3] = moveFour;
  runCycle[4] = moveFive;
  runCycle[5] = moveSix;
  runCycle[6] = moveSeven;
  runCycle[7] = moveEight;
  
  xPos = 450;
  yPos = 450;
  
  movementSpeed = 10;
  currentRun = 0;
  delay = 0;
  
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
  image(character, xPos, yPos);

  if (delay > 0){
    delay -=1;
  }
  
  if (delay == 0){
  movement();
  }
  
}

void movement(){
  
  if (keyboardInput.isPressed(Controller.MOVE_LEFT) && xPos > 0) {
  background(255);
  xPos = xPos - movementSpeed;
  
    if (currentRun > 7){
    currentRun = 0;
  }
  image(runCycle[(int)currentRun], xPos, yPos);
  currentRun +=.2;
  }

  if (keyboardInput.isPressed(Controller.MOVE_RIGHT) && xPos < 800) {
  background(255);
  xPos = xPos + movementSpeed;
  
    if (currentRun > 7){
    currentRun = 0;
    }
  image(runCycle[(int)currentRun], xPos, yPos);
  currentRun +=.2;
  }
  
  if (keyboardInput.isPressed(Controller.MOVE_UP) && yPos > 0) {
  background(255);
  yPos = yPos - movementSpeed;
  
    if (currentRun > 7){
    currentRun = 0;
    }
  image(runCycle[(int)currentRun], xPos, yPos);
  currentRun +=.2;
  }
  
  if (keyboardInput.isPressed(Controller.MOVE_DOWN) && yPos < 750) {
  background(255);
  yPos = yPos + movementSpeed;
  
   if (currentRun > 7){
   currentRun = 0;
   }
  image(runCycle[(int)currentRun], xPos, yPos);
  currentRun +=.2;
  }
  
  
}
