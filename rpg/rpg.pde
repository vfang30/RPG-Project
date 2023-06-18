double idle;
float gravity = 3;
float speed = 0;

boolean jump;
double currentJump;

PImage areaOne;

double currentRun;
int movementSpeed;

Player player;

Controller keyboardInput;

PImage[] location; 

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

  
  location = new PImage[8];
  
  movementSpeed = 7;
  currentRun = 0;
  
  player = new Player();
  keyboardInput = new Controller();
  
  jump = false;
  currentJump = 1;
  
  String path = sketchPath("data\\idle");
  println(path);

}

void draw() {
  background(255);
  image(areaOne, 0, 0);
  
  playerDraw();
  movement();
  
  if (jump){
    speed = 0;
    player.yPos = player.yPos - gravity;
    loadBackground();
      playerDraw();
    if (player.yPos < 340){
      jump = false;
    }
  }
  
  if (!jump && player.yPos < 490){
    currentJump = 0;
    speed = speed + gravity;
    player.yPos = player.yPos + speed;
  }
  
  idle += 0.03;
  if ((int)idle > 1){
  idle = 0;
  }
  
}

void playerDraw(){
  
  if (jump){
    
   if (currentJump < 7 && currentJump > 2){
    currentJump += .05;
   }
   
   if (currentJump < 2){
     currentJump += .8;
   }
    
    image(player.jumpCycle[(int)currentJump], player.xPos, player.yPos);
  }
  
  if (player.direction ==  1 && !jump){
   image(player.idleCycle[(int)idle], player.xPos, player.yPos);
  }
  
  if (player.direction == 0 && !jump){
  image(player.idleCycleFlipped[(int)idle], player.xPos, player.yPos);
  }
  
}

void movement(){
  
  boolean moved = false;
  
  boolean left = keyboardInput.isPressed(Controller.MOVE_LEFT);
  boolean right = keyboardInput.isPressed(Controller.MOVE_RIGHT);


  if (left && player.xPos > 40) {
    
  loadBackground();
  player.xPos = player.xPos - movementSpeed;
  player.direction = Player.WEST;
  
    if (currentRun > 7){
    currentRun = 0;
  }
  image(player.runCycleFlipped[(int)currentRun], player.xPos, player.yPos);
  currentRun +=.05;
  
  moved = true;
  }

  if (right && player.xPos < 1000) {
    
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

String[] listFileNames(String dir){
  File file = new File(dir);
  if (file.isDirectory()){
    String names[] = file.list();
    return names;
  }else{
  return null;
  }
}
