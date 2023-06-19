PFont font;

double idle;
float gravity = .8;
float speed = 0;
float velocity = 40;

boolean jump;
boolean falling;
double currentJump;

PImage areaOne;
PImage areaZero;

double currentRun;
int movementSpeed;

Player player;

Controller keyboardInput;

PImage[] location; 

Combat testing;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}


void setup() {
  size(1100, 900);
  
  font = createFont("AlternityBold-YWl4.ttf", 128);
  textFont(font);
  
  idle = 0;
  
  areaOne = loadImage("areaone.png");
  areaOne.resize(1100, 900);
  
  areaZero = loadImage("areazero.png");
  areaZero.resize(1100, 900);

  
  location = new PImage[8];
  
  movementSpeed = 7;
  currentRun = 0;
  
  keyboardInput = new Controller();
  player = new Player();
  
  jump = false;
  falling = false;
  currentJump = 1;
  
  //TESTING CODE
  Vishu one = new Vishu();
  Vishu two = new Vishu();
  Vishu three = new Vishu();
  ArrayList<Fighter> party = new ArrayList<Fighter>();
  party.add(one);
  party.add(two);
  party.add(three);
  
  Vishu four = new Vishu();
  ArrayList<Fighter> enemies = new ArrayList<Fighter>();
  enemies.add(four);
  testing = new Combat(party, enemies);

}

void draw() {
  background(255);
  image(areaZero, 0, 0);
  
  testing.run();
  
  //playerDraw();
  //movement();
  
  //if (jump && velocity > 0){
  //  speed = 0;
  //  velocity = velocity - gravity;
  //  player.yPos = player.yPos - velocity;
  //  loadBackground();
  //    playerDraw();
  //  if (player.yPos < 480){
  //    jump = false;
  //  }
  //}
  
  //if (!jump && player.yPos < 690){
  //  velocity = 20;
  //  currentJump = 0;
  //  speed = speed + gravity;
  //  player.yPos = player.yPos + speed;
  //}
  
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
  image(areaZero, 0, 0);
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
