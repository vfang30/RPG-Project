import java.util.*;
abstract class Fighter{
  private String name;
  private int baseHP, hp, maxHP;
  private int baseATK, atk;
  private int baseDEF, def;
  private int baseSPEED, speed;
  private int baseMANA, mana, maxMana;
  private int xp;
  private int level;
  private Move[] moveList = new Move[4];
  
  private PImage avatar;
  private PImage avatarIdle;
  private PImage portrait;
  private PImage[] idleCycle = new PImage[2];
  private PImage[] atkCycle = new PImage[8];
  private boolean attack;
  private int yPos;
  private int xPos;
  
  public Fighter(String name, int hp, int atk, int def, int mana, int speed){
    this.xp = 0;
    this.level = 1;
    
    this.name = name;
    baseHP = hp;
    baseATK = atk;
    baseDEF = def;
    baseSPEED = speed;
    baseMANA = mana;
    
    this.hp = calcStat(baseHP);
    maxHP = this.hp;
    this.atk = calcOther(baseATK);
    this.def = calcOther(baseDEF);
    this.speed = calcOther(baseSPEED);
    this.mana = calcStat(baseMANA);
    maxMana = this.mana;
    
    attack = false;
  }
  
  public Fighter(){
  }
  
  //stat calcs
  public int calcStat(int baseStat){  //hp and mana calc
    return (int)(((2 * baseStat * level)/25) + level + 10);
  }
  
  public int calcOther(int baseStat){ //calc for all other stats
    return (int)(((2 * baseStat * level)/25) + 5);
  }
  
  //damage calc
  public String damage(Move move, Fighter other){
    int damage = 0;
    if (move.accuracy < random(101)){
    return "Miss";
    }else{
      damage = (int)( ((atk/other.def) * move.basePower * ( (2 * level + 10)/62.5) * random(0.85, 1)) + 2);
      other.applyDamage(damage);
    }
    return "" +  damage;
  }
  
  //get methods
  public String getName(){
    return name;
  }
  
  public int getHP(){
    return hp;
  }
  
  public int getMaxHP(){
    return maxHP;
  }
  
  public int getAtk(){
    return atk;
  }
  
  public int getSpeed(){
    return speed;
  }
  
  public int getMana(){
    return mana;
  }
  
  public int getMaxMana(){
    return maxMana;
  }
  
  public int getXP(){
    return xp;
  }
  
  public int getLevel(){
    return level;
  }
  
  public PImage getPortrait(){
    return portrait;
  }
  
  public String attack(Fighter other){
    int damage = (int)(random(atk/2, atk));
    other.applyDamage(damage);
    return (this + " attacked " + other + " for " + damage + " damage!");
  }

  //set methods
  public void setHP(int health){
    hp = health;
  }
  
  public void setAtk(int attack){
    atk = attack;
  }
  
  public void setSpeed(int spd){
    speed = spd;
  }
  
  public void setMana(int m){
    mana = m;
  }
  
  public void setXP(int exp){
    xp = exp;
  }
  
  public void setLevel(int lvl){
    level = lvl;
  }

  public String toString(){
    return this.getName();
  }
  
  public void applyDamage(int amount){
    this.hp -= amount;
    if (this.hp < 0){
    this.hp = 0;
    }
  }
}
