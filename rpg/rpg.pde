PImage character;
int xPos;
int yPos;
int movementSpeed;

void setup(){
  character = loadImage("character.png");
  character.resize(80, 0);
  size(900, 900);
  xPos = 450;
  yPos = 450;
  movementSpeed = 10;
}

void draw(){

  movement();
  
}


void movement(){
  if (keyPressed){
    if (keyCode == UP && yPos > 0){
      up();
    }
    if (keyCode == DOWN && yPos < 750){
      down();
    }
    if (keyCode == RIGHT && xPos < 800){
      right();
    }
    if (keyCode == LEFT && xPos > 0){
      left();
    }
  }
}


void up(){
  background(255);
  yPos = yPos - movementSpeed;
  image(character, xPos, yPos);
}

void down(){
  background(255);
  yPos = yPos + movementSpeed;
  image(character, xPos, yPos);
}

void right(){
  background(255);
  xPos = xPos + movementSpeed;
  image(character, xPos, yPos);
}

void left(){
  background(255);
  xPos = xPos - movementSpeed;
  image(character, xPos, yPos);
}
