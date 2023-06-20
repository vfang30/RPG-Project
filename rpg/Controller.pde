class Controller {
  static final int MOVE_LEFT = 0;
  static final int MOVE_RIGHT = 1;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[2];
  }

  /**@param code: a valid constant e.g. P1_LEFT
  */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if(code == LEFT)
      inputs[MOVE_LEFT] = true;
    if(code == RIGHT)
      inputs[MOVE_RIGHT] = true;
  }
  
  void release(int code) {
    if(code == LEFT){
    inputs[MOVE_LEFT] = false;
    }
    
    if(code == RIGHT){
    inputs[MOVE_RIGHT] = false;
    }
  }
}
