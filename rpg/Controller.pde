class Controller {
  static final int MOVE_LEFT = 0;
  static final int MOVE_RIGHT = 1;
  static final int MOVE_UP = 2;
  static final int MOVE_DOWN = 3;
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
    if(code == 'S')
      inputs[MOVE_DOWN] = true;
    if(code == 'W')
      inputs[MOVE_UP] = true;
  }
  
  void release(int code) {
    if(code == 'A')
    inputs[MOVE_LEFT] = false;
    inputs[MOVE_UP] = false;
    inputs[MOVE_DOWN] = false;
    if(code == 'D')
    inputs[MOVE_RIGHT] = false;
    inputs[MOVE_UP] = false;
    inputs[MOVE_DOWN] = false;
  }
}
