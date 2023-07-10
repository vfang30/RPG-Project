class Move{
  
  static final int ATTACKING = 0;
  static final int SUPPORT = 1;
  private String name;
  private int basePower;
  private int accuracy;
  private int mana;
  private int moveType;
  private int cooldown;
  private int turnsSince;

  public Move(String name, int moveType, int basePower, int accuracy, int mana, int cooldown){
  this.name = name;
  this.moveType = moveType;
  this.basePower = basePower;
  this.accuracy = accuracy;
  this.mana = mana;
  this.cooldown = cooldown;
  turnsSince = cooldown;
  }
}
