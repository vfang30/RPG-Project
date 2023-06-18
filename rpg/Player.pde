class Player {

static final int EAST = 1;
static final int WEST = 0;

String idlePath = sketchPath("data\\idle\\normal");
String[] idle = listFileNames(idlePath);

String idlePathFlip = sketchPath("data\\idle\\flip");
String[] idleFlip = listFileNames(idlePathFlip);

String runPath = sketchPath("data\\run\\normal");
String[] run = listFileNames(runPath);

String runPathFlip = sketchPath("data\\run\\flip");
String[] runFlip = listFileNames(runPathFlip);

int direction;
  


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
PImage[] runCycleFlipped = new PImage[8];

PImage[] jumpCycle = new PImage[8];

float xPos;
float yPos;

  public Player(){
    printArray(run);
  xPos = 450;
  yPos = 490;
  direction = EAST;
 
  //normal idle sprites
  for (int i = 0; i < 2; i +=1){
    PImage image = loadImage("idle/normal/"+idle[i]);
    image.resize(150, 0);
    idleCycle[i] = image;
  }
  
  //flipped idle sprites
  for (int i = 0; i < 2; i +=1){
    PImage image = loadImage("idle/flip/"+idleFlip[i]);
    image.resize(150, 0);
    idleCycleFlipped[i] = image;
  }
  
  //run sprites
  for (int i = 0; i < 8; i +=1){
    PImage image = loadImage("run/normal/"+run[i]);
    image.resize(150, 0);
    runCycle[i] = image;
  }
  
  //flipped run sprites
  for (int i = 0; i < 8; i +=1){
    PImage image = loadImage("run/flip/"+runFlip[i]);
    image.resize(150, 0);
    runCycleFlipped[i] = image;
  }
  
  
  //moveOneFlip = loadImage("move/charmoveoneflipped.png");
  //moveOneFlip.resize(150, 0);
  
  //moveTwoFlip = loadImage("move/charmovetwoflipped.png");
  //moveTwoFlip.resize(150, 0);
  
  //moveThreeFlip = loadImage("move/charmovethreeflipped.png");
  //moveThreeFlip.resize(150, 0);
  
  //moveFourFlip = loadImage("move/charmovefourflipped.png");
  //moveFourFlip.resize(150, 0);
  
  //moveFiveFlip = loadImage("move/charmovefiveflipped.png");
  //moveFiveFlip.resize(150, 0);
  
  //moveSixFlip = loadImage("move/charmovesixflipped.png");
  //moveSixFlip.resize(150, 0);
  
  //moveSevenFlip = loadImage("move/charmovesevenflipped.png");
  //moveSevenFlip.resize(150, 0);
  
  //moveEightFlip = loadImage("move/charmoveeightflipped.png");
  //moveEightFlip.resize(150, 0);
  
  //runCycleFlip[0] = moveOneFlip;
  //runCycleFlip[1] = moveTwoFlip;
  //runCycleFlip[2] = moveThreeFlip;
  //runCycleFlip[3] = moveFourFlip;
  //runCycleFlip[4] = moveFiveFlip;
  //runCycleFlip[5] = moveSixFlip;
  //runCycleFlip[6] = moveSevenFlip;
  //runCycleFlip[7] = moveEightFlip;
  
  jumpOne = loadImage("jump/jumpone.png");
  jumpOne.resize(150, 0);
  
  jumpTwo = loadImage("jump/jumptwo.png");
  jumpTwo.resize(150, 0);
  
  jumpThree = loadImage("jump/jumpthree.png");
  jumpThree.resize(150, 0);
  
  jumpFour = loadImage("jump/jumpfour.png");
  jumpFour.resize(150, 0);
  
  jumpFive = loadImage("jump/jumpfive.png");
  jumpFive.resize(150, 0);
    
  jumpSix = loadImage("jump/jumpsix.png");
  jumpSix.resize(150, 0);
  
  jumpSeven = loadImage("jump/jumpseven.png");
  jumpSeven.resize(150, 0);
  
  jumpEight = loadImage("jump/jumpeight.png");
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
