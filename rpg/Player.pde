class Player {

static final int EAST = 1;
static final int WEST = 0;

int direction;
  
PImage character;
PImage characterIdle;

PImage characterFlip;
PImage characterIdleFlip;  
  
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

PImage jumpOne;
PImage jumpTwo;
PImage jumpThree;
PImage jumpFour;
PImage jumpFive;
PImage jumpSix;
PImage jumpSeven;
PImage jumpEight;

PImage[] idleCycle = new PImage[2];
PImage[] idleCycleFlipped = new PImage[2];

PImage[] runCycle = new PImage[8];
PImage[] runCycleFlip = new PImage[8];

PImage[] jumpCycle = new PImage[8];

float xPos;
float yPos;

  public Player(){
    
  xPos = 450;
  yPos = 490;
  direction = EAST;
    
  character = loadImage("character.png");
  character.resize(150, 0);
  
  characterIdle = loadImage("characteridle.png");
  characterIdle.resize(150, 0);
  
  characterFlip = loadImage("characterflipped.png");
  characterFlip.resize(150, 0);
  
  characterIdleFlip = loadImage("characteridleflipped.png");
  characterIdleFlip.resize(150, 0);
  
  idleCycle[0] = character;
  idleCycle[1] = characterIdle;
  
  idleCycleFlipped[0] = characterFlip;
  idleCycleFlipped[1] = characterIdleFlip;
  
  moveOne = loadImage("charmoveone.png");
  moveOne.resize(150, 0);
  
  moveTwo = loadImage("charmovetwo.png");
  moveTwo.resize(150, 0);
  
  moveThree = loadImage("charmovethree.png");
  moveThree.resize(150, 0);
  
  moveFour = loadImage("charmovefour.png");
  moveFour.resize(150, 0);
  
  moveFive = loadImage("charmovefive.png");
  moveFive.resize(150, 0);
  
  moveSix = loadImage("charmovesix.png");
  moveSix.resize(150, 0);
  
  moveSeven = loadImage("charmoveseven.png");
  moveSeven.resize(150, 0);
  
  moveEight = loadImage("charmoveeight.png");
  moveEight.resize(150, 0);
    
  runCycle[0] = moveOne;
  runCycle[1] = moveTwo;
  runCycle[2] = moveThree;
  runCycle[3] = moveFour;
  runCycle[4] = moveFive;
  runCycle[5] = moveSix;
  runCycle[6] = moveSeven;
  runCycle[7] = moveEight;
  
  moveOneFlip = loadImage("charmoveoneflipped.png");
  moveOneFlip.resize(150, 0);
  
  moveTwoFlip = loadImage("charmovetwoflipped.png");
  moveTwoFlip.resize(150, 0);
  
  moveThreeFlip = loadImage("charmovethreeflipped.png");
  moveThreeFlip.resize(150, 0);
  
  moveFourFlip = loadImage("charmovefourflipped.png");
  moveFourFlip.resize(150, 0);
  
  moveFiveFlip = loadImage("charmovefiveflipped.png");
  moveFiveFlip.resize(150, 0);
  
  moveSixFlip = loadImage("charmovesixflipped.png");
  moveSixFlip.resize(150, 0);
  
  moveSevenFlip = loadImage("charmovesevenflipped.png");
  moveSevenFlip.resize(150, 0);
  
  moveEightFlip = loadImage("charmoveeightflipped.png");
  moveEightFlip.resize(150, 0);
  
  runCycleFlip[0] = moveOneFlip;
  runCycleFlip[1] = moveTwoFlip;
  runCycleFlip[2] = moveThreeFlip;
  runCycleFlip[3] = moveFourFlip;
  runCycleFlip[4] = moveFiveFlip;
  runCycleFlip[5] = moveSixFlip;
  runCycleFlip[6] = moveSevenFlip;
  runCycleFlip[7] = moveEightFlip;
  
  jumpOne = loadImage("jumpone.png");
  jumpOne.resize(150, 0);
  
  jumpTwo = loadImage("jumptwo.png");
  jumpTwo.resize(150, 0);
  
  jumpThree = loadImage("jumpthree.png");
  jumpThree.resize(150, 0);
  
  jumpFour = loadImage("jumpfour.png");
  jumpFour.resize(150, 0);
  
  jumpFive = loadImage("jumpfive.png");
  jumpFive.resize(150, 0);
    
  jumpSix = loadImage("jumpsix.png");
  jumpSix.resize(150, 0);
  
  jumpSeven = loadImage("jumpseven.png");
  jumpSeven.resize(150, 0);
  
  jumpEight = loadImage("jumpeight.png");
  jumpEight.resize(150, 0);
  
  jumpCycle[0] = jumpOne;
  jumpCycle[1] = jumpTwo;
  jumpCycle[2] = jumpThree;
  jumpCycle[3] = jumpFour;
  jumpCycle[4] = jumpFive;
  jumpCycle[5] = jumpSix;
  jumpCycle[6] = jumpSeven;
  jumpCycle[7] = jumpEight;
  
  }
  
}
