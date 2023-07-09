class Move{
  
  static final int attacking = 0;
  static final int support = 1;
  private int basePower;
  private float accuracy;
  private int mana;
  private int moveType;

  public Move(int basePower, float accuracy, int mana, int moveType){
  this.basePower = basePower;
  this.accuracy = accuracy;
  this.mana = mana;
  this.moveType = moveType;
  }
}
