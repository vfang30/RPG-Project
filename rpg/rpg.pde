double idle;
float gravity = .8;
float speed = 0;
float velocity = 20;

boolean jump;
boolean falling;
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
  
  movementSpeed = 10;
  currentRun = 0;
  
  player = new Player();
  keyboardInput = new Controller();
  
  jump = false;
  falling = false;
  currentJump = 1;
  

}

void draw() {
  background(255);
  image(areaOne, 0, 0);
  
  playerDraw();
  movement();
  
  if (jump && velocity > 0){
    speed = 0;
    velocity = velocity - gravity;
    player.yPos = player.yPos - velocity;
    loadBackground();
      playerDraw();
    if (player.yPos < 280){
      jump = false;
    }
  }
  
  if (!jump && player.yPos < 490){
    velocity = 20;
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
    
    jump();
    
  }
  
  if (player.direction == Player.EAST && !jump){
   image(player.idleCycle[(int)idle], player.xPos, player.yPos);
  }
  
  if (player.direction == Player.WEST && !jump){
  image(player.idleCycleFlipped[(int)idle], player.xPos, player.yPos);
  }
  
}

void jump(){

  if (currentJump < 7 && currentJump > 2){
   currentJump += 0.2;
  }
   
  if (currentJump < 2){
   currentJump += .8;
  }
    
  if (player.direction == Player.EAST){
   image(player.jumpCycle[(int)currentJump], player.xPos, player.yPos);
   }
   
  if (player.direction == Player.WEST){
   image(player.jumpCycleFlipped[(int)currentJump], player.xPos,  player.yPos);
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
  
  image(player.runCycleFlipped[(int)currentRun], player.xPos, player.yPos);
  currentRun +=.05;
  
  if (currentRun > 7){
    currentRun = 0;
  }
  
  moved = true;
  }

  if (right && player.xPos < 1000) {
    
  loadBackground();
  player.xPos = player.xPos + movementSpeed;
  player.direction = Player.EAST;
  
  image(player.runCycle[(int)currentRun], player.xPos, player.yPos);
  currentRun +=.05;
  
   if (currentRun > 7){
    currentRun = 0;
   }
  
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
