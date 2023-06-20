



/* Right now the character will stop falling once they fall below a certain y coord but this is gonna have to be changed in the future
if we ever add any platforming/anything that would require jumping -Victor */ 


PFont font;

boolean fight;

double idle; //idle state 
float gravity = .7; 
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

PImage[] location; //plan to use this to store diffeent locations in the game

//TESTING CODE
Combat testing;

void setup() {
  size(1200, 900);
  
  font = createFont("FFFFORWA.TTF", 128);
  textFont(font);
  
  idle = 0;
  
  areaOne = loadImage("areas/"+"areaone.png");
  areaOne.resize(1200, 900);
  
  areaZero = loadImage("areas/"+"areazero.png");
  areaZero.resize(1200, 900);

  
  movementSpeed = 8;
  currentRun = 0;
  
  keyboardInput = new Controller();
  player = new Player();
  
  jump = false;
  currentJump = 0;
  
  //TESTING CODE
  fight = false;
  Vishu one = new Vishu();
  one.setHP(10);
  one.setMana(14);
  Vishu two = new Vishu();
  Vishu three = new Vishu();
  ArrayList<Fighter> party = new ArrayList<Fighter>();
  party.add(one);
  party.add(two);
  party.add(three);
  
  Vishu four = new Vishu();
  Vishu five = new Vishu();
  Vishu six = new Vishu();
  ArrayList<Fighter> enemies = new ArrayList<Fighter>();
  enemies.add(four);
  enemies.add(five);
  enemies.add(six);
  testing = new Combat(party, enemies);
}

void keyPressed() {
  if (!fight){
    keyboardInput.press(keyCode);
    if (keyCode == UP && player.yPos >= 690){
      jump = true;
    }
  }
  if (fight){
    testing.keyPressedCombat();
  }
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

void mouseClicked(){
fight = !fight;
}

void draw() {
  background(255);
  image(areaZero, 0, 0);
  
  if (fight){
  testing.run();
  }else{
  
  playerDraw();
  movement();
  gravity();
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

void gravity(){
  
  //while in jump player goes up by velocity (velocity pulled down by gravity)
  if (jump){
    velocityDown = 0;
    velocityUp = velocityUp - gravity;
    player.yPos = player.yPos - velocityUp;

    if (velocityUp <= 0){ //stop jump state when velocity stops
      jump = false;
    }
    
  }
  
  //fall down
  if (!jump && player.yPos < 690){
    //reset upward velocity and jump cycle in preparation for next jump
    velocityUp = 20;
    currentJump = 0;
    
    //go down
    velocityDown = velocityDown + gravity;
    player.yPos = player.yPos + velocityDown;
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
    
  player.xPos = player.xPos - movementSpeed; //shift the player's x coord to the left
  player.direction = Player.WEST; //change the direction to west for the idle cycle
  
  if (player.yPos >= 690){
  loadBackground();
  image(player.runCycleFlipped[(int)currentRun], player.xPos, player.yPos);
  currentRun +=.05;
  }
  
  //reset run cycle
  if (currentRun > 7){
    currentRun = 0;
  }
  
  moved = true;
  }

  if (right && player.xPos < 1000) {
    
  player.xPos = player.xPos + movementSpeed; //shift the player's x coord to the right
  player.direction = Player.EAST; //change the direction to east for the idle cycle
  
  if (player.yPos >= 690){
  loadBackground();
  image(player.runCycle[(int)currentRun], player.xPos, player.yPos);
  currentRun +=.05;
  }
  
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
