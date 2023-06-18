class Controller {
  static final int MOVE_LEFT = 0;
  static final int MOVE_RIGHT = 1;
  static final int JUMP = 2;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[4];//2 valid buttons
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
  }
  
  void release(int code) {
    if(code == 'A')
    inputs[MOVE_LEFT] = false;
    
    if(code == 'D')
    inputs[MOVE_RIGHT] = false;
    
    if (code == 'W'){
     player.yPos -= 100;
     delay += 60;
    inputs[JUMP] = false;
    }
  }
}
