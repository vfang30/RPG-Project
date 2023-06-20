class Player {

static final int EAST = 1;
static final int WEST = 0;

//Sprites
String idlePath = sketchPath("data\\idle\\normal");
String[] idle = listFileNames(idlePath);

String idlePathFlip = sketchPath("data\\idle\\flip");
String[] idleFlip = listFileNames(idlePathFlip);

String runPath = sketchPath("data\\run\\normal");
String[] run = listFileNames(runPath);

String runPathFlip = sketchPath("data\\run\\flip");
String[] runFlip = listFileNames(runPathFlip);

String jumpPath = sketchPath("data\\jump\\normal");
String[] jump = listFileNames(jumpPath);

String jumpPathFlip = sketchPath("data\\jump\\flip");
String[] jumpFlip = listFileNames(jumpPathFlip);

PImage[] idleCycle = new PImage[2];
PImage[] idleCycleFlipped = new PImage[2];

PImage[] runCycle = new PImage[8];
PImage[] runCycleFlipped = new PImage[8];

PImage[] jumpCycle = new PImage[8];
PImage[] jumpCycleFlipped = new PImage[8];


//Position
float xPos;
float yPos;
int direction;

  public Player(){
  xPos = 450;
  yPos = 690;
  direction = EAST;
 
  //normal idle sprites
  for (int i = 0; i < 2; i +=1){
    PImage image = loadImage("idle/normal/"+idle[i]);
    idleCycle[i] = image;
  }
  
  //flipped idle sprites
  for (int i = 0; i < 2; i +=1){
    PImage image = loadImage("idle/flip/"+idleFlip[i]);
    idleCycleFlipped[i] = image;
  }
  
  //run sprites
  for (int i = 0; i < 8; i +=1){
    PImage image = loadImage("run/normal/"+run[i]);
    runCycle[i] = image;
  }
  
  //flipped run sprites
  for (int i = 0; i < 8; i +=1){
    PImage image = loadImage("run/flip/"+runFlip[i]);
    runCycleFlipped[i] = image;
  }
  
  //jump sprites
  for (int i = 0; i < 8; i +=1){
    PImage image = loadImage("jump/normal/"+jump[i]);
    jumpCycle[i] = image;
  }
  
  //flipped jump sprites
  for (int i = 0; i < 8; i +=1){
    PImage image = loadImage("jump/flip/"+jumpFlip[i]);
    jumpCycleFlipped[i] = image;
  }

  
  }
  
}
