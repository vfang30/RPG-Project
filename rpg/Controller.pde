class Controller {
  static final int MOVE_LEFT = 0;
  static final int MOVE_RIGHT = 1;
  static final int JUMP = 2;
  static final int MOVE_DOWN = 3;
  static final int ENT = 4;
  static final int  CANCEL = 5;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[6];
  }

  /**@param code: a valid constant e.g. P1_LEFT
  */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if(code == 'A')
      inputs[MOVE_LEFT] = true;
    if(code == 'D')
      inputs[MOVE_RIGHT] = true;
    if(code == 'W')
      inputs[JUMP] = true;
    if(code == 'S')
      inputs[MOVE_DOWN] = true;
    if(code == ENTER)
      inputs[ENT] = true;
    if(code == 'X')
      inputs[CANCEL] = true;
  }
  
  void release(int code) {
    if(code == 'A'){
    inputs[MOVE_LEFT] = false;
    }
    
    if(code == 'D'){
    inputs[MOVE_RIGHT] = false;
    }
    
    if(code == 'W'  && player.yPos >= 490){
    inputs[JUMP] = false;
    jump = true;
    }
    
    if(code == 'S'){
    inputs[MOVE_DOWN] = false;
    }
    
    if(code == ENTER){
    inputs[ENT] = false;
    }
    
    if(code == 'X'){
    inputs[CANCEL] = false;
    }
    
  }
}
