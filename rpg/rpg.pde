PImage character;
PImage moveOne;

int xPos;
int yPos;

int currentRun;
int movementSpeed;

Controller keyboardInput;
PImage[] runCycle;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

void setup() {
  size(900, 900);
  
  character = loadImage("character.png");
  character.resize(80, 0);
  
  moveOne = loadImage("charmoveone.png");
  moveOne.resize(80, 0);
  
  runCycle = new PImage[8];
  runCycle[0] = moveOne;
  
  xPos = 450;
  yPos = 450;
  movementSpeed = 10;
  currentRun = 0;
  
  keyboardInput = new Controller();
  

}

//Visualize which keys are being held down...
void draw() {
  background(255);
  image(character, xPos, yPos);

  movement();

}

void movement(){
  if (keyboardInput.isPressed(Controller.MOVE_LEFT) && xPos > 0) {
  background(255);
  xPos = xPos - movementSpeed;
  image(runCycle[currentRun], xPos, yPos);
  }

  if (keyboardInput.isPressed(Controller.MOVE_RIGHT) && xPos < 800) {
  background(255);
  xPos = xPos + movementSpeed;
  image(character, xPos, yPos);
  }
  
  if (keyboardInput.isPressed(Controller.MOVE_UP) && yPos > 0) {
  background(255);
  yPos = yPos - movementSpeed;
  image(character, xPos, yPos);
  }
  
  if (keyboardInput.isPressed(Controller.MOVE_DOWN) && yPos < 750) {
  background(255);
  yPos = yPos + movementSpeed;
  image(character, xPos, yPos);
  }
}
