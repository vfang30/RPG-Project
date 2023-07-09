class Move{
  
  static final int attacking = 0;
  static final int support = 1;
  private String name;
  private int basePower;
  private float accuracy;
  private int mana;
  private int moveType;

  public Move(String name, int basePower, float accuracy, int mana, int moveType){
  this.name = name;
  this.basePower = basePower;
  this.accuracy = accuracy;
  this.mana = mana;
  this.moveType = moveType;
  }
}
