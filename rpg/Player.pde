class Player {

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

PImage[] idleCycle;
PImage[] idleCycleFlipped;

PImage[] runCycle;
PImage[] runCycleFlip;

  public Player(){
  character = loadImage("character.png");
  character.resize(100, 0);
  
  characterIdle = loadImage("characteridle.png");
  characterIdle.resize(100, 0);
  
  characterFlip = loadImage("characterflipped.png");
  characterFlip.resize(100, 0);
  
  characterIdleFlip = loadImage("characteridleflipped.png");
  characterIdleFlip.resize(100, 0);
  
  idleCycle = new PImage[2];
  idleCycle[0] = character;
  idleCycle[1] = characterIdle;
  
  idleCycleFlipped = new PImage[2];
  idleCycleFlipped[0] = characterFlip;
  idleCycleFlipped[1] = characterIdleFlip;
  
  moveOne = loadImage("charmoveone.png");
  moveOne.resize(100, 0);
  
  moveTwo = loadImage("charmovetwo.png");
  moveTwo.resize(100, 0);
  
  moveThree = loadImage("charmovethree.png");
  moveThree.resize(95, 0);
  
  moveFour = loadImage("charmovefour.png");
  moveFour.resize(100, 0);
  
  moveFive = loadImage("charmovefive.png");
  moveFive.resize(110, 0);
  
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
  
  moveOneFlip = loadImage("charmoveoneflipped.png");
  moveOneFlip.resize(100, 0);
  
  moveTwoFlip = loadImage("charmovetwoflipped.png");
  moveTwoFlip.resize(100, 0);
  
  moveThreeFlip = loadImage("charmovethreeflipped.png");
  moveThreeFlip.resize(95, 0);
  
  moveFourFlip = loadImage("charmovefourflipped.png");
  moveFourFlip.resize(100, 0);
  
  moveFiveFlip = loadImage("charmovefiveflipped.png");
  moveFiveFlip.resize(110, 0);
  
  moveSixFlip = loadImage("charmovesixflipped.png");
  moveSixFlip.resize(100, 0);
  
  moveSevenFlip = loadImage("charmovesevenflipped.png");
  moveSevenFlip.resize(100, 0);
  
  moveEightFlip = loadImage("charmoveeightflipped.png");
  moveEightFlip.resize(100, 0);
  
  runCycleFlip = new PImage[8];
  runCycleFlip[0] = moveOneFlip;
  runCycleFlip[1] = moveTwoFlip;
  runCycleFlip[2] = moveThreeFlip;
  runCycleFlip[3] = moveFourFlip;
  runCycleFlip[4] = moveFiveFlip;
  runCycleFlip[5] = moveSixFlip;
  runCycleFlip[6] = moveSevenFlip;
  runCycleFlip[7] = moveEightFlip;
  }
  
}
